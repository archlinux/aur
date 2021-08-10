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
_pkgver=1.2.28-1
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
sha256sums=('2d42442305de8d214c330bbbaae0fde89335d53078bd6fce1e1a274ed60fd1d1')


prepare() {
      cat <<EOF

!! IMPORTANT NOTE !!

This package will NOT build straight out of the box.
First off, you need to download the PURCHASED .deb file provided by the Aseprite developers.

Place the downloaded .deb file next to this PKGBUILD and run makepkg.
If it still does not work, please ensure the .deb file has the right name.

EOF
}

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
