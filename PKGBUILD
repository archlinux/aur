# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranoclient
pkgver=2.1.0
pkgrel=1
pkgdesc='Python client library for Murano'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-prettytable' 'python-glanceclient'
         'python-keystoneclient' 'python-iso8601' 'python-six' 'python-babel'
         'python-pyopenssl' 'python-requests' 'python-yaml' 'python-yaql'
         'python-osc-lib' 'python-muranopkgcheck' 'python-oslo-serialization'
         'python-oslo-utils' 'python-oslo-log' 'python-oslo-i18n')
checkdepends=('python-fixtures' 'python-mock' 'python-requests-mock'
              'python-tempest' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-oslotest' 'python-os-testr')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9c25aafe3b53a210893a625383a48f9dd981dc669703aea2c0d3741eb51ef840db5435585589a6c13143708a975a3563080545130bf4a5ca9eac4988a41cb3be')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' muranoclient/tests/unit/osc/v1/*.py
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
