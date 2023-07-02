# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranoclient
pkgver=2.6.0
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
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('d1e73369eccb114aa4793f3c2109f604d7d8a4d17fa0cf79d6550cd3e10cb254eee720a95460acec6707e87c03526b8dabfafea806f463c8f93358153290516c')

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
