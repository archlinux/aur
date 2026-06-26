# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_blazarclient
pkgname=python-blazarclient
pkgver=4.5.0
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
sha512sums=('404b14b14ca8dee67ee44b8b10ad7711279cacd2495c9dcb0ab9f7e33057791994c254590ae4d63d4a96dc8a908ed222b3bbea2e9c9e0ac4a097043eb500b2b7')

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
