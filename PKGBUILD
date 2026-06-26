# Maintainer: Andy Botting <andy@andybotting.com>

_name=aodhclient
pkgname=python-aodhclient
pkgver=3.11.0
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
sha512sums=('270c02450244c509476c0d1735384783c06ec8bd24873b198303372d383116c102389331df0a7c0012d3144f04703705759112cfd6549409c26c65b2c2e27e3f')

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
