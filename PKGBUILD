# Maintainer: Andy Botting <andy@andybotting.com>

_name=yaql
pkgname="python-$_name"
pkgver=3.0.0
pkgrel=2
pkgdesc='YAQL - Yet Another Query Language'
arch=(any)
url='https://yaql.readthedocs.io'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-six python-pbr python-babel python-dateutil
         python-ply)
checkdepends=(python-fixtures python-testtools python-stestr)
source=("https://tarballs.opendev.org/openstack/$_name/$_name-$pkgver.tar.gz")
sha512sums=('79800862fd0ef13b3595656f02b09f137aed30fb0f92e7f8d3ffd261160ff4bfdec6e1a6239217e7fd5ba078eb70367ca16eb12853e28917d8fcbbfe08b290dd')

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
