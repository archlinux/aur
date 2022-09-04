# Maintainer: Kaan Genc <aur@kaangenc.me>
# Contributor: DelightedCat <bottledlactose@gmail.com>

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
_pkgver=1.2.39-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create animated sprites and pixel art"
arch=('x86_64')
url="https://www.aseprite.org/"
license=('custom: aseprite EULA')
depends=(libglvnd fontconfig libxcursor)
provides=(aseprite)
conflicts=(aseprite)
source=("local://Aseprite_${_pkgver}_amd64.deb")
sha256sums=('d918758459ba4962a794d5e1da58e2a6d07be54c92d1b41a10c04f7d070726f5')

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
