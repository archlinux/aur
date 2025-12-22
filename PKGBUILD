# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_blazarclient
pkgname=python-blazarclient
pkgver=4.4.0
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
sha512sums=('4bb8c22747ac5be926e1db293426deb5c70b7f2f04391268a713b1901b25b2003510f02d76c83944ffde510f79c18745894e0a0f8112283ef9b98d34afeccd97')

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
