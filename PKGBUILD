# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.5.0
pkgrel=1
pkgdesc='Python client library for Ironic'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-six python-requests python-yaml
         python-openstackclient python-prettytable python-oslo-utils
         python-oslo-serialization python-oslo-i18n python-osc-lib
         python-keystoneauth1 python-jsonschema python-dogpile.cache
         python-appdirs python-pbr)
checkdepends=(python-fixtures python-requests-mock python-mock
              python-babel python-oslotest python-testtools python-tempest
              python-stestr python-ddt python-openstackclient)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ec30e9e98d55fa862375448291a55a74c702eae7b7445471a45fc14630bc27d3a1f40484aad4deb9b07631367c4fbf8769773c6ef8ed16af10a411e7a27ee810')

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
