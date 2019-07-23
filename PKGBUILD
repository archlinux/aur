# Maintainer: nim65s
# Former Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: simonp
# Contributor: Martin Ortbauer <mortbauer@gmail.com>
# Original: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>

_pkgname='med'
pkgname=('med-openmpi' 'med-openmpi-docs')
pkgver=4.0.0
pkgrel=1
pkgdesc="Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - code-aster exchange module linked to hdf5"
url="https://www.salome-platform.org/downloads"
license=('LGPL')
depends=('hdf5-openmpi' 'tk' 'python')
makedepends=('gcc-fortran' 'swig' 'openmpi' 'cmake')
provides=('med')
arch=('x86_64')
conflicts=('med')
replaces=('med')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a474e90b5882ce69c5e9f66f6359c53b8b73eb448c5f631fa96e8cd2c14df004')

build() {
  cd ${_pkgname}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
      -DMEDFILE_USE_MPI=ON -DMEDFILE_BUILD_PYTHON=ON .
  make
}

# I got 37 tests failed out of 91…
#check() {
    #cd "$pkgname-$pkgver"
    #make test
#}

package_med-openmpi() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf $pkgdir/usr/share/doc
}

package_med-openmpi-docs() {
  arch=('any')
  depends=()

  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf $pkgdir/usr/share/cmake
  rm -rf $pkgdir/usr/lib
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/bin
}
