# Maintainer: Ruben Bekaert <bekaertruben@gmail.com>
# Contributor: Timmy Yao <timmy.yao@outlook.com.au>

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
  "5f044dcb53edc372730fa32916f9c6596d61b06bfaf59963fc65af357b3ada3e"
 )

prepare() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  patch --forward --strip=0 --input="${srcdir}/boost-placeholders.patch"
}

build() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  cmake .
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  make DESTDIR="${pkgdir}/" install
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install "${srcdir}/icon.png" -t "${pkgdir}/usr/local/share/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
