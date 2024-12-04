# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.9.0
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
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('ead6ad9ed3c8e5575bb7b7297dc74d804cd16732a706b4fbbfa5000509b7939a06e74b70ac0e4cb91d0d6e845cb49030e178fde1151cfadf945049e2108715e0')

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
