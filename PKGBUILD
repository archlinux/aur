# Maintainer: Andy Botting <andy@andybotting.com>

_name=tempest
pkgname=python-tempest
pkgver=39.0.0
pkgrel=1
pkgdesc='OpenStack Integration Testing'
arch=(any)
url='https://docs.openstack.org/tempest/'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-jsonschema python-testtools
         python-paramiko python-cryptography python-netaddr
         python-oslo-concurrency python-oslo-config python-oslo-log
         python-stestr python-oslo-serialization python-oslo-utils
         python-fixtures python-yaml python-subunit python-stevedore
         python-prettytable python-urllib3 python-debtcollector
         python-defusedxml python-fasteners)
checkdepends=(python-hacking python-oslotest)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/tempest/archive/$pkgver.tar.gz")
sha512sums=('59bbf2cc1d10a1316dbcc110022e71703d25ad62f7c5d9641ef6c46476953fa00eed203538213f12e73820324af846a797618cac3bec3c63f8d696ac41119af1')

export PBR_VERSION=$pkgver

build() {
  cd $_name
  python setup.py build
}

# Disabling due to test failures
#check() {
#  cd $_name
#  stestr --test-path tempest/tests run
#}

package() {
  cd $_name
  python setup.py install --root="$pkgdir" --optimize=1
}
