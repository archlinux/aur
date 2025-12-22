# Maintainer: Andy Botting <andy@andybotting.com>

_name=python_cloudkittyclient
pkgname=python-cloudkittyclient
pkgver=5.4.0
pkgrel=1
pkgdesc='Client library for the CloudKitty API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-keystoneauth1
         python-oslo-utils python-oslo-log python-yaml
         python-jsonpath-rw-ext python-os-client-config
         python-osc-lib)
checkdepends=(python-oslotest python-stestr python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_name-$pkgver.tar.gz")
sha512sums=('81e4d67d5be0e78f6c7ca1c577118bad5bc9586c6ae2336d76f09f3427e3cfd1805d439c3cd31853953c9881294ba58e8edd179f0bbb6fc03e38911c596e22c2')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  stestr run
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
