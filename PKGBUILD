# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-cloudkittyclient
pkgver=5.1.0
pkgrel=2
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
sha512sums=('05f67c7ffdd1d895ce9db548d4223855c4603d9fe8a36546369dac9d1c7b8b482365951a14de68d34fdf4bb5fdc6cf9dc9cdc3b9d21edc86678d3f8e0c076e4e')

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
