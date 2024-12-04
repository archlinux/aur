# Maintainer: Andy Botting <andy@andybotting.com>

_name=aodhclient
pkgname=python-aodhclient
pkgver=3.7.0
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
sha512sums=('325e301fa53affa23e61e08809f691bef9a61e23218ede98296f01686ce12e20a74cd83bc979c7f513afeb84afda430bcf238f295d780093ae05f66669a6adf0')

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
