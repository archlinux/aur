# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-yaql
pkgver=2.0.1
pkgrel=1
pkgdesc='YAQL - Yet Another Query Language'
arch=(any)
url='https://yaql.readthedocs.io'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-six python-pbr python-babel python-dateutil
         python-ply)
checkdepends=(python-fixtures python-testtools python-stestr)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/yaql/archive/$pkgver.tar.gz")
sha512sums=('f5aa3277e4d0de1b18a4266d4012205083292ef1175c672ef8d3d25de4b7ca34eca5a4ce13b0f1525885afaa3af082bc51a0e658a2fabe0c12e6506f707a937b')

export PBR_VERSION=$pkgver

build() {
  cd yaql
  python setup.py build
}

check() {
  cd yaql
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' yaql/tests/*.py
  stestr run --test-path ./yaql/tests
}

package() {
  cd yaql
  python setup.py install --root="$pkgdir" --optimize=1
}
