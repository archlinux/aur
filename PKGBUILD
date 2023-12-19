# Maintainer: Ruben Bekaert <bekaertruben@gmail.com>

pkgname=gplates

pkgdesc="GPlates is a plate tectonics program. Manipulate reconstructions of geological and paleogeographic features through geological time. Interactively visualize vector, raster and volume data."
url="https://www.gplates.org"
license=(GPLv2)

arch=(any)
pkgver=2.4.0
pkgrel=2

# Some of these dependencies are not listed in the documentation, but are used anyways. These might be optional.
depends=(libgl glu glew python python-numpy boost qt5-base qt5-svg qt5-xmlpatterns gdal cgal proj qwt zlib graphviz gmp mpfr arrow)
makedepends=(cmake doxygen patchelf)

source=(
  "${pkgname}_${pkgver}_src.tar.bz2::https://www.earthbyte.org/download/9758/"
  "icon.png"
  "gplates.desktop"
)
sha256sums=(
  "9ae877f2fa10c3526362d699f65b6a81908d760c416d85fe5e7b8193fee8aab8"
  "9335fb98b21bc03c1cbec21ca945bded6ac60f66bb14997654b1829c1bd7265b"
  "c9cf5e841e3bc1e730c5c1fa00a1137f532de4c2859637e67d1682f021eebb11"
 )

prepare() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
}

build() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"

  cmake -DCMAKE_INSTALL_PREFIX="/usr/" -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  make DESTDIR="${pkgdir}/" install
  install "${srcdir}/icon.png" -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
