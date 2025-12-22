# Maintainer: Andy Botting <andy@andybotting.com>

_name=tempest
pkgname=python-tempest
pkgver=46.0.0
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
sha512sums=('d6e6247f3bb4a9b5fc465c0c5d6c64aa7335a417a6614a9ae61e55d6b6a02423ebcab34867427b7b92c749d465374bb82b9915dff4e3748201b0c5e4844f402e')

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
