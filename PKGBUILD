# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ironicclient
pkgver=5.8.0
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
sha512sums=('fa96807bb17907f9ae9a761c9dcd4e87e5fed5d73a978da0e0e8536574277032c52fd96675bf7738271616e3f2897b67dba4d8ac3731ff0785ed2b8a91acb900')

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
