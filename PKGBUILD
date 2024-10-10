# Maintainer: Hector Mtz-Seara <hseara # gmail.com>
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>
# Contributor: Samo Turk <samo.turk@gmail.com>
pkgname=rdkit
pkgver=2024_09_1
pkgrel=1
pkgdesc="An open-source toolkit for cheminformatics and machine learning with Python API"
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD-3-Clause')
depends=(python python-numpy python-cairocffi python-pillow boost-libs sqlite cairo)
makedepends=(cmake catch2 boost eigen)
source=(
    "https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz"
)
sha256sums=(
    '034c00d6e9de323506834da03400761ed8c3721095114369d06805409747a60f'
)


build() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRDK_BUILD_INCHI_SUPPORT=OFF \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DRDK_BUILD_CAIRO_SUPPORT=ON
  make
}

package() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}/build
  make DESTDIR=${pkgdir} install 
}
