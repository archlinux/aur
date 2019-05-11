# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-yaql
pkgver=1.1.3
pkgrel=4
pkgdesc='YAQL - Yet Another Query Language'
arch=('any')
url='https://yaql.readthedocs.io'
license=('Apache')
depends=('python-six' 'python-pbr' 'python-babel' 'python-dateutil'
         'python-ply')
checkdepends=('python-fixtures' 'python-subunit' 'python-testrepository'
              'python-testtools')
source=("https://github.com/openstack/yaql/archive/$pkgver.tar.gz")
sha512sums=('a4c5e8311d181d64f17db9b01cb6ce6cc28bc4ca91f9ddfd539c2fb58f1f989d7d091f7d4e74d51d70d44c71ea223276b7e6c03e83802a468b2db0d486c62d86')

export PBR_VERSION=$pkgver

build() {
  cd yaql-$pkgver
  python setup.py build
}

check() {
  cd yaql-$pkgver
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' yaql/tests/*.py
  python setup.py testr
}

package() {
  cd yaql-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
