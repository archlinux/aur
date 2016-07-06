# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=trine3-hib
pkgver=2015.12.01
pkgrel=3
pkgdesc="action role-playing platform and puzzle video game. humblebundle version."
url="https://trine3.com"
arch=('x86_64')
license=('commercial')
depends=("xorg-xwininfo")
install=trine3.install
source=("hib://trine3_linux.zip"
        "trine3.desktop"
        "http://frozenbyte.com/presskit/trine_3/images/logo.png")
# there is a patch downloadable, but it is already included in the game
md5sums=('28070d73b2291c30e31b5ef486b9f3ac'
         '39ab5e4a22180be7fae2735ba76340ae'
         '1e36d51c0b6ddf8f283a46404796d85b')
PKGEXT=".pkg.tar"
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
 
package() {
    # copy game files
    mkdir -p "${pkgdir}/opt/trine3"
    mv "${srcdir}/linux/"* "${pkgdir}/opt/trine3"

    # install desktop file and icon
    install -Dm644 "$srcdir/trine3.desktop" "$pkgdir/usr/share/applications/trine3.desktop"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    convert -resize 48x48 "$srcdir/logo.png" "$pkgdir/usr/share/pixmaps/trine3_48.png"
    convert -resize 64x64 "$srcdir/logo.png" "$pkgdir/usr/share/pixmaps/trine3_64.png"

    # starter script
    mkdir -p "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/trine3" << \here
#!/bin/sh
cd /opt/trine3
./trine3.sh
here
    chmod a+x "${pkgdir}/usr/bin/trine3"
}
