# Maintainer: Andy Botting <andy@andybotting.com>

_name=yaql
pkgname="python-$_name"
pkgver=3.2.0
pkgrel=1
pkgdesc='YAQL - Yet Another Query Language'
arch=(any)
url='https://yaql.readthedocs.io'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-six python-pbr python-babel python-dateutil
         python-ply)
checkdepends=(python-fixtures python-testtools python-stestr)
source=("https://tarballs.opendev.org/openstack/$_name/$_name-$pkgver.tar.gz")
sha512sums=('8e650a7114babd1c30af25f7cf37cb0099033d5c202df14a26fb7d04650197c889a30ad4f6911e3cd22b24c010b611b39621040fd4f86d0b520b4b3b5d04c1d0')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' yaql/tests/*.py
  stestr run --test-path yaql/tests
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
