# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.6.0
pkgrel=1
pkgdesc='Python client library for Ironic'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-platformdirs python-cliff python-dogpile.cache
         python-jsonschema python-keystoneauth1 python-openstacksdk
         python-osc-lib python-oslo-utils python-osc-lib python-oslo-utils
         python-yaml python-requests python-stevedore)
checkdepends=(python-fixtures python-requests-mock python-oslotest
              python-testtools python-tempest python-stestr python-ddt
              python-openstackclient)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('aa0c2f57a14af2b4cf23796f166fa63782c1cda16aa78f9430a19295a10070960bc684ad945df35ecafd1095bf5b739cbcce090fe4ddd07968ba4b0344e291d5')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  stestr run
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}
