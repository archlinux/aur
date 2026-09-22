# Maintainer: aquova <mail@aquova.net>
# Contributor: Kaan Genc <aur@kaangenc.me>

#
# !! IMPORTANT NOTE !!
#
# This package will NOT build straight out of the box.
# First off, you need to download the PURCHASED .deb file provided by the Aseprite developers.
#
# Place the downloaded .deb file next to this PKGBUILD and run makepkg.
# If it still not work, please ensure the .deb file has the right name.
#

pkgname=aseprite-bin
pkgver=1.3.18.5
_pkgver=${pkgver}-1
pkgrel=1
pkgdesc="Create animated sprites and pixel art"
arch=('x86_64')
url="https://www.aseprite.org/"
license=('custom: aseprite EULA')
depends=(libglvnd fontconfig libxcursor)
provides=(aseprite)
conflicts=(aseprite)
source=("local://Aseprite_${_pkgver}_amd64.deb")
sha256sums=('46d50b12d809dbd2017d571f9a342aa78b00b42f3c4e0d275438fc7cdb821c16')

package() {
    tar xf data.tar.xz -C $pkgdir

    chmod -R 755 $pkgdir/usr
    chmod +x $pkgdir/usr/bin/aseprite

    install -d "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp -r "${pkgdir}"/usr/share/doc/aseprite/EULA.txt \
          "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp -r "${pkgdir}"/usr/share/doc/aseprite/docs/LICENSES.md \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}
