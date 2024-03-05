# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-blazarclient
pkgver=4.0.1
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
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b6cda005f0e7ed821fa094d8408dccb11dd438f07f5193c0dde1a46749c6ded82594e154a0023578951a03f60ed7b6a0e53a6a20c80137e21e08c37551a8f69e')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
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
