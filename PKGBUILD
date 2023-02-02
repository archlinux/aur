# Maintainer: Ruben Bekaert <bekaertruben@gmail.com>

pkgname=gplates

pkgdesc="GPlates is a plate tectonics program. Manipulate reconstructions of geological and paleogeographic features through geological time. Interactively visualize vector, raster and volume data."
url="https://www.gplates.org"
license=(GPLv2)

arch=(x86_64)
pkgver=2.3.0
pkgrel=1

depends=(libgl glu glew qt5-base qwt qt5-svg qt5-xmlpatterns boost gdal gmp cgal proj zlib arrow graphviz)
optdepends=(python python-numpy)
makedepends=(cmake doxygen)

source=(
  "${pkgname}_${pkgver}_src.zip::https://www.earthbyte.org/download/8426"
  "boost-placeholders.patch"
  "icon.png"
  "gplates.desktop"
)
sha256sums=(
  "7d4be9d524d1fcbb6a81de29bd1d4b13133082db23f0808965c5efe30e9538ab"
  "3f65493ff661f36cdc1cff9f672a529a922783b481bbd4dd9d997701d7e7b6ec"
  "9335fb98b21bc03c1cbec21ca945bded6ac60f66bb14997654b1829c1bd7265b"
  "c9cf5e841e3bc1e730c5c1fa00a1137f532de4c2859637e67d1682f021eebb11"
 )

prepare() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  patch --forward --strip=0 --input="${srcdir}/boost-placeholders.patch"
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
