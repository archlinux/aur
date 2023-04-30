# Old Maintainers: Samo Turk <samo.turk@gmail.com>, Hector Mtz-Seara <hseara # gmail.com>
# Maintainer: Benjamin Smith <newzealandbenjy@gmail.com>
pkgname=rdkit-inchi
pkgver=2023_03_01
pkgrel=2
pkgdesc="A collection of cheminformatics and machine-learning software written in C++ and Python. This version includes InChI support."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD')
depends=(python python-numpy python-cairocffi python-pillow boost boost-libs sqlite cairo eigen)
makedepends=('cmake>=3.1')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('db346afbd0ba52c843926a2a62f8a38c7b774ffab37eaf382d789a824f21996c')
conflicts=('rdkit-python2' 'rdkit-git' 'rdkit' 'openbabel')
provides=(rdkit)


build() {
  cd "${srcdir}/rdkit-Release_${pkgver}"
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRDK_BUILD_INCHI_SUPPORT=ON \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DRDK_BUILD_CAIRO_SUPPORT=ON
  make
}

package() {
  cd "${srcdir}/rdkit-Release_${pkgver}/build"
  DESTDIR=${pkgdir} make install
}
