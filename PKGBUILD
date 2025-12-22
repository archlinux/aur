# Maintainer: Andy Botting <andy@andybotting.com>

_name=aodhclient
pkgname=python-aodhclient
pkgver=3.9.1
pkgrel=1
pkgdesc='Client library for the Aodh API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-osc-lib python-oslo-i18n
         python-oslo-serialization python-oslo-utils python-osprofiler
         python-keystoneauth1 python-six python-pyparsing)
checkdepends=(python-oslotest python-stestr python-testtools)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_name-$pkgver.tar.gz")
sha512sums=('019b2ece5abfbcfbfee9155005b21ff8f3a7aa524309b3cce582757171f7e86cb9b0fc7bf656fea2465b176d29753f06836ae74fa490b4e85acac6cc2b3a87ea')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  # Remove functional tests as they're complicated to run
  rm -fr aodhclient/tests/functional
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
