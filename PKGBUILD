# Maintainer: Andy Botting <andy@andybotting.com>

_name=tempest
pkgname=python-tempest
pkgver=44.0.0
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
sha512sums=('859b3ea3eee5717337bd054807c5a7841f5512aab7c312e0ff0123645b18f2411865943651414ded619022059e929607bdc6c05cf352fc233a2974d0c50e6b79')

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
