# Maintainer: Andy Botting <andy@andybotting.com>

_name=yaql
pkgname="python-$_name"
pkgver=3.1.0
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
sha512sums=('90722182a4ed8bcdbf3a459ff90b1c2e7c54de4e95da22dd954d020e25a4d0b1d6f0386df25bc51f88cc46fc53d8d884e172e5b36462c818d7ece0ba72fd270f')

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
