# Old Maintainer: Samo Turk <samo.turk@gmail.com>
# Maintainer: Hector Mtz-Seara <hseara # gmail.com>
pkgname=rdkit
pkgver=2021_09_4
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD')
depends=(python python-numpy python-cairocffi python-pillow boost boost-libs sqlite cairo eigen)
makedepends=('cmake>=3.1')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('ce192e85bbdc1dcf24d327197229099c8625ee20ef022fcbd980791fdbfc7203')
conflicts=('rdkit-python2' 'rdkit-git')
provides=(rdkit)



build() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}
  sed -i 's/23ed3f833c1ae0adb141a26b4a30d73e/850b0df852f1cda4970887b540f8f333/' ${srcdir}/${pkgname}-Release_${pkgver}/Code/GraphMol/MolDraw2D/CMakeLists.txt
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
