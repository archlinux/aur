# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-aodhclient
pkgver=3.5.0
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
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('301b702be32161d13ae2b70c4f4abb175208ce8c941f0e4ddcb494c70caa4e24ecbb422b0f25c04ddbbddf838ed2ab53571ca36df85b77b7c73e60cca042bd61')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
  # Remove functional tests as they're complicated to run
  rm -fr aodhclient/tests/functional
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
