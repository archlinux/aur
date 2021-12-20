# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-pydstool
_pkgname=PyDSTool
pkgver=0.91.0
pkgrel=2
pkgdesc="Simulation and analysis environment for dynamical systems"
url="http://pydstool.sf.net/"
license=('BSD')
arch=('any')
depends=('python<3.10' 'python-numpy' 'python-scipy')
replaces=('python2-pydstool')
makedepends=('dos2unix' 'python-setuptools')
checkdepends=('python-pytest-mock' 'python-pytest-xdist')
source=($_pkgname-$pkgver.tar.gz::https://github.com/robclewley/$_pkgname/archive/v$pkgver.tar.gz)
options=('!emptydirs')
sha256sums=('828730549872851ff78746e17421ad66ce0dfd74026539bc72247f405f5768f7')

build() {
  cd "${_pkgname,,}-$pkgver"
  python setup.py build
}

check() { # multiple python3 errors
  cd "${_pkgname,,}-$pkgver"
  python setup.py test
}

package() {
  cd "${_pkgname,,}-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
