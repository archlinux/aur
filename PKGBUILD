# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-cloudkittyclient
pkgver=5.0.0
pkgrel=1
pkgdesc='Client library for the CloudKitty API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-keystoneauth1
         python-oslo-utils python-oslo-log python-pyyaml
         python-jsonpath-rw-ext python-os-client-config
         python-osc-lib)
checkdepends=(python-oslotest python-stestr python-openstackclient)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('18ec2ac3987050ec44f90ebd17a99b653c03b0ba2ca1f3a866578cb909c729a4f90381a59d73af18f4fa62faa2c17bceacb8501a159562795ccff6a0410e2392')

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
