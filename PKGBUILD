# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-yaql
pkgver=3.0.0
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
sha512sums=('38ab283babc10aeae20a7abaa5d2113a7ae66654bc04035fce3e0819ee86265ca5146b47fe229fb7ca67bcf31185543b1d1d266abc179903f42bf2ba7a13257a')

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
