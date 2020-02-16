# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranoclient
pkgver='2.0.0'
pkgrel='1'
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
sha512sums=('73a128cd9c84271873e41506d5e1cb3b4c1c0a2698f82704b362b93ae3eaf673addb37a3128490a4b9c6b1ae62e4e8f7347b6e1b96f4d1d6b81ec55ef724ef5d')

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
