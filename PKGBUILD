# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.7.0
pkgrel=2
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
sha512sums=('f819a2be1301da821eb340da789dd188dea33fb48b2ea2f3ec740eb04b66cf121fc1f72f592e3f17cd38be30b9afedf4209dbe725eaa772938a9977a83e84506')

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
