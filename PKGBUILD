# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.2.0
pkgrel=1
pkgdesc='Python client library for Ironic'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-six' 'python-requests' 'python-yaml'
         'python-openstackclient' 'python-prettytable' 'python-oslo-utils'
         'python-oslo-serialization' 'python-oslo-i18n' 'python-osc-lib'
         'python-keystoneauth1' 'python-jsonschema' 'python-dogpile.cache'
         'python-appdirs' 'python-pbr')
checkdepends=('python-fixtures' 'python-requests-mock' 'python-mock'
              'python-babel' 'python-oslotest' 'python-testtools' 'python-tempest'
              'python-stestr' 'python-ddt' 'python-openstackclient')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('03863aa6142737e246646c056773fd848d1fde73fc5590f9ba3c4768e9948dd304b53740f2f0e0dbad342cd41f9b0f6b570e8227da8e7e8f79f82a8c48704a29')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
