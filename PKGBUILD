# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus
pkgname=python-$_name
pkgver=5.1.6
pkgrel=2
pkgdesc="A framework for scientific/industrial CLIs and GUIs"
arch=('any')
url='http://taurus-scada.org/'
license=('LGPL3')
depends=(python-pyqt5 python-lxml python-click python-pint python-ply)
makedepends=(python-setuptools)
optdepends=('python-pytango: for integration with TANGO control system'
            'python-sardana: for integration with Sardana'
            'python-epics: for integration with EPICS control system'
            'python-taurus-pyqtgraph: for pyqtgraph based trends'
            'python-pymca5: for extra pymca5 widgets'
            'python-guiqwt: for extra guiqwt widgets'
            'spyder: for a qt based editor within taurus')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz" "int.patch")
sha256sums=('d1897903c6523a04f08b63fa4873303d6df8e8fb08e91a2838fa4ee29c1e0d62'
            '72c9f2374827d12a482f099237a45d315515ceb90ec6c8dd2aad7f54f8031261')

prepare(){
  cd "$_name-$pkgver"
  patch -N -p1 --input="${srcdir}/int.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
