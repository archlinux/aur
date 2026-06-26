# Maintainer: Andy Botting <andy@andybotting.com>

# Python package name now is with an underscore
_pname=python_barbicanclient
pkgname=python-barbicanclient
pkgver=7.4.0
pkgrel=1
pkgdesc='Client library for the Barbican Key Management API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-requests python-cliff
         python-keystoneauth1 python-oslo-i18n
         python-oslo-serialization python-oslo-utils)
checkdepends=(python-fixtures python-requests-mock python-stestr
              python-testtools python-oslotest python-oslo-config
              python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('c8899e3a8c21a595bf3b09e9b9989e03679a6a6a10e8e807220ae7b7343b359a3687580bdf53a21c8aa4e1f79a2555cd3ee11e8ad2464deaa408272df123010e')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
