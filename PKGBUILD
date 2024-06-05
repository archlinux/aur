# Maintainer: Hector Mtz-Seara <hseara # gmail.com>
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>
# Contributor: Samo Turk <samo.turk@gmail.com>
pkgname=rdkit
pkgver=2024_03_3
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD')
depends=(python python-numpy python-cairocffi python-pillow boost boost-libs sqlite cairo eigen)
makedepends=('cmake>=3.14')
source=(
    "https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz"
)
sha256sums=(
    '52f79c6bf1d446cdb5c86a35de655d96bad0c52a5f4ecbe15f08eaf334e6f76a'
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
