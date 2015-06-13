# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=aliensrl
pkgver=0.8.2
_pkgver=082
pkgrel=1
pkgdesc="Based on the Aliens movie and from the creator of DoomRL."
arch=("i686" "x86_64")
url="http://alien.chaosforge.org/"
license=("unknown")
depends=("sdl_mixer")

case $CARCH in
  'i686')
    source=("http://alien.chaosforge.org/file_download/8/aliensrl-linux-i386-$_pkgver.tar.gz"
            "launcher")
    md5sums=('6603726c3ca3da09b942591fc09df2c8'
             'cb7fd513fcc1e1655b68c05bd88c1da6')
    __arch='i386' ;;
  'x86_64')
    source=("http://alien.chaosforge.org/file_download/7/aliensrl-linux-x64-$_pkgver.tar.gz"
            "launcher")
    md5sums=('6eccd6822e79d775d2c0eb62dfe40809'
             'cb7fd513fcc1e1655b68c05bd88c1da6')
    __arch='x64' ;;
esac

package() {
    cd "aliensrl-linux-$__arch-$_pkgver"

    # sdl mode is buggy
    sed -i 's/^ascii_mode.*false/ascii_mode = true/' config.lua

    # Copy program and required files
    install -d "$pkgdir/opt/$pkgname"
    chmod -R +r ./
    #chmod +x {voice,sound,music}
    cp -a *  "$pkgdir/opt/$pkgname"

    # Copy script used to run program
    install -D "$srcdir/launcher" "$pkgdir/usr/bin/$pkgname"

    # This is needed to save games and scores
    chmod 4755 "$pkgdir/opt/$pkgname/abrl"
}
