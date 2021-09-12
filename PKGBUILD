# Maintainer: Miepee <janbidler00 at tutanota dot com>
pkgname=fxball-remastered
pkgver=1.0
pkgrel=2
pkgdesc="A classic Breakout / Arkanoid arcade game with a few twists. Made by DoctorM64."
arch=(x86_64)
url="https://doctorm64.itch.io/fxb-remastered"
license=('none')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-libxxf86vm' 'lib32-libglvnd' 'lib32-curl' 'lib32-openal' 'lib32-glibc' 'lib32-openssl-1.0' 'lib32-libxext' 'lib32-libx11' 'lib32-libx11' 'lib32-libxrandr' 'lib32-glu' 'lib32-libidn2' 'lib32-libssh2' 'lib32-libpsl' 'lib32-openssl' 'lib32-krb5' 'lib32-zstd' 'lib32-libxcb' 'lib32-libxrender' 'lib32-libunistring' 'lib32-e2fsprogs' 'lib32-keyutils' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libpulse' 'lib32-libcurl-compat')
source=("$pkgname-$pkgver.zip::https://matix.li/4763d465f26d")
md5sums=("75b9b759c5c6a798c686d412197e1b05")

package() {
    # remove orphaned file
    rm -f $pkgname-$pkgver.zip

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/$pkgname/"
    cp -r ./ "$pkgdir/opt/$pkgname"
    chmod +x "$pkgdir/opt/$pkgname/FX_Ball_Remastered"

    #creating shell script cause gms1.4 dumb
    echo "#! /usr/bin/sh
LD_PRELOAD=libcurl.so.3 /opt/$pkgname/FX_Ball_Remastered" > "$pkgdir/opt/$pkgname/startFXBall-Remastered.sh"

    chmod +x "$pkgdir/opt/$pkgname/startFXBall-Remastered.sh"

    ln -sf "/opt/$pkgname/startFXBall-Remastered.sh" "$pkgdir/usr/bin/$pkgname"

    # Adding desktop entry
    mkdir -p "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Type=Application
Categories=Game
Encoding=UTF-8
Name=FX Ball Remastered
Comment=A classic Breakout / Arkanoid arcade game, but you can control up to 4 paddles at the same time with the mouse.
Exec=fxball-remastered
Icon=/opt/fxball-remastered/assets/icon.png
Terminal=false" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
