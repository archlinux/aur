# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=4.11.0
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
sha512sums=('c5e23273db4a3adf1a9e5f476d492acb9e0b00398413bf9eb970706376ed8eea1426dc52c62831243c252eab31c73b5469db780b9faa36e5c8e85119f21449e3')

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
