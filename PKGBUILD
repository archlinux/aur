# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-cloudkittyclient
pkgver=5.1.0
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
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b16629a4399a5062d0b71462eea3fd44299dc0b9ad785d8b595a4905cb27d579d1a0b49af09222c318e8f2fd6ac6889d930be59876d25e5a47e9d151dbaf986a')

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
