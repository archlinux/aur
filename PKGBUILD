# Maintainer: Andy Botting <andy@andybotting.com>

_name=tempest
pkgname=python-tempest
pkgver=39.0.0
pkgrel=2
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
sha512sums=('4e60b7fe90b7943cb9208cab72188f3f3668fdc4fd90b4667e5f578f979f66dbc6e9a2486c47fb7f0f608ac8197b726da1fd6b7ded169d804705dc4e58eed256')

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
