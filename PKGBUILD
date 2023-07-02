# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-yaql
pkgver=2.0.0
pkgrel=2
pkgdesc='YAQL - Yet Another Query Language'
arch=('any')
url='https://yaql.readthedocs.io'
license=('Apache')
depends=('python-six' 'python-pbr' 'python-babel' 'python-dateutil'
         'python-ply')
checkdepends=('python-fixtures' 'python-testtools' 'python-stestr')
source=("https://opendev.org/openstack/yaql/archive/$pkgver.tar.gz")
sha512sums=('75371b535067aac766302b74a8633230a48d2a0791e3d360e97f7d09175cccddb14d6306bd183f01a6ed6d8fb7fc5815a5f256fdbb1a73277d45bc110bd6e1c4')

export PBR_VERSION=$pkgver

build() {
  cd yaql-$pkgver
  python setup.py build
}

check() {
  cd yaql-$pkgver
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' yaql/tests/*.py
  stestr run --test-path ./yaql/tests
}

package() {
  cd yaql-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
