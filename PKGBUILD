# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_blazarclient
pkgname=python-blazarclient
pkgver=4.6.0
pkgrel=1
pkgdesc='Client library for the Blazar API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-prettytable python-oslo-i18n
         python-oslo-log python-oslo-utils python-keystoneauth1
         python-osc-lib)
checkdepends=(python-oslotest python-fixtures python-stestr
              python-testtools)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('3bdb4c6fb2ed71d81241c1f936cdf090624f2a744f9d713498c81b4bf7723ab315eaf614aba61d655b1e2612c9a52690d0ba04973904520183cfabd1279194f7')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
