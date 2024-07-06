# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-cloudkittyclient
pkgver=5.2.0
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
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('32993c37a41f04cbdcfd14e97d17bf5d70ac2c192af18817892ea9cd9dc73ecd8a9f9f681e4d13c62d6559e446c61324d6ee2e8dfb4ed70e5bc7fa858edbf0cd')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
