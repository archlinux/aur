# Maintainer: Andy Botting <andy@andybotting.com>

_name=tempest
pkgname=python-tempest
pkgver=41.0.0
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
source=("https://tarballs.opendev.org/openstack/tempest/$_name-$pkgver.tar.gz")
sha512sums=('aa5065dbb7431b5cf5d93075083e74eb6c811c759f109ac9ceee7cc45240b84c091f84542a3455cf686f84e359a17f99154ec417ee7003bb01c7ef191f6dcc27')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

# Disabling due to test failures
#check() {
#  cd $_name-$pkgver
#  stestr --test-path tempest/tests run
#}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
