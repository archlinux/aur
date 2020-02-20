# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit
pkgver=2019_09_3
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD')
depends=(python python-numpy python-cairocffi python-pillow boost boost-libs sqlite cairo eigen)
makedepends=('cmake>=3.1')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('88bbc298eb6c17584471b17a34e202b1da3d59d92ea5b6b6dcda635b739f76f2')
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
