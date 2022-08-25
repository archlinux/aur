# Old Maintainer: Samo Turk <samo.turk@gmail.com>
# Maintainer: Hector Mtz-Seara <hseara # gmail.com>
pkgname=rdkit
pkgver=2022_03_5
pkgrel=2
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD')
depends=(python python-numpy python-cairocffi python-pillow boost boost-libs sqlite cairo eigen)
makedepends=('cmake>=3.1')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('38e6fb9f063b6132310f17e654f2c4350876f9164b0a17b49fe3df7d0555a744')
conflicts=('rdkit-python2' 'rdkit-git')
provides=(rdkit)


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
