# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Todd Partridge <toddrpartridge@gmail.com>

pkgname=worldofgoo
pkgver=1.53
pkgrel=1
pkgdesc="A physics based puzzle/construction game (requires copy of the full game)."
arch=(i686 x86_64)
url="https://2dboy.com/"
license=(custom)
depends=(sdl2_mixer)
optdepends=("worldofgoo-gootool: for creating and installing fan levels")
install=$pkgname.install
source=(hib://WorldOfGoo.Linux.1.53.sh
        $pkgname.desktop)
md5sums=('9049f4fccf98ba79ac238a8b414e053a'
         '706ff492ea8096e1a2a7ee9a4d171aca')
options=(!strip)
DLAGENTS+=("hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.")


package()
{
    cd "$srcdir"

    [[ "$CARCH" = "x86_64" ]] && _arch=x86_64 || _arch=x86

    # data
    install -Dm755 "$srcdir/data/${_arch}/WorldOfGoo.bin.${_arch}" -t "$pkgdir"/opt/worldofgoo
    cp -aT "$srcdir"/data/noarch "$pkgdir"/opt/worldofgoo

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s "/opt/worldofgoo/WorldOfGoo.bin.${_arch}" "$pkgdir"/usr/bin/worldofgoo

    # desktop integration
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -d "$pkgdir"/usr/share/pixmaps
    ln -s /opt/worldofgoo/game/gooicon.png "$pkgdir"/usr/share/pixmaps/worldofgoo.png

    # doc
    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/worldofgoo/readme.html

    # legal
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "$srcdir"/data/eula.txt
}

# vim:et:sw=4:sts=4
