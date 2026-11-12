# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_blazarclient
pkgname=python-blazarclient
pkgver=4.6.1
pkgrel=1
pkgdesc='Client library for the Blazar API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache-2.0)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-prettytable python-oslo-i18n
         python-oslo-log python-oslo-utils python-keystoneauth1
         python-osc-lib python-oslo-serialization python-requests)
checkdepends=(python-oslotest python-fixtures python-stestr
              python-testtools)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('ba786d2d2f58c875e7ef85f4ed6a9d114ed27c4bdcd166844fb2b557fe507686207449eab3b216c4dd61d92c245bd14028d9a8de0e582aba00664565ac4282eb')

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
