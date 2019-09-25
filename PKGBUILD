# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-barbicanclient
pkgver='4.9.0'
pkgrel='1'
pkgdesc='Client library for the Barbican Key Management API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-prettytable' 'python-requests' 'python-six'
         'python-cliff' 'python-keystoneauth1' 'python-oslo-i18n'
         'python-oslo-serialization' 'python-oslo-utils')
checkdepends=('python-fixtures' 'python-requests-mock' 'python-mock'
              'python-testrepository' 'python-testtools' 'python-oslotest'
              'python-nose' 'python-oslo-config' 'python-openstackclient')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('53f65c8935c076bbb15e765a55c8ebda8e28ea775dc598dcf3381d32a7ce5c2b3edc1076a009fdc2b001a8eaf547c884922cd067a9d4e32daf52825283645af8')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  sed -i 's/assertItemsEqual/assertCountEqual/g' barbicanclient/tests/v1/*.py
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
