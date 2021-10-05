# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-yaql
pkgver=2.0.0
pkgrel=1
pkgdesc='YAQL - Yet Another Query Language'
arch=('any')
url='https://yaql.readthedocs.io'
license=('Apache')
depends=('python-six' 'python-pbr' 'python-babel' 'python-dateutil'
         'python-ply')
checkdepends=('python-fixtures' 'python-subunit' 'python-testrepository'
              'python-testtools')
source=("https://github.com/openstack/yaql/archive/$pkgver.tar.gz")
sha512sums=('70871113c5c8395e5340123a166ebd261cb60d17ec57af5d656feeb0d3329d614ca9d8915906325354cb8f0ceeadf6bbd9bd0ae87200c20efa1f66248f979a06')

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
