# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=5.0.0
pkgrel=1
pkgdesc='Client library for OpenStack Manila API'
arch=(any)
url="http://docs.openstack.org/$pkgname"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-oslo-config python-oslo-log python-oslo-serialization
         python-oslo-utils python-pbr python-prettytable
         python-requests python-simplejson python-babel python-six
         python-keystoneclient)
checkdepends=(python-ddt python-fixtures python-mock python-stestr
              python-tempest python-testtools python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('15a0ce6ae7732520abf717381e2e447bf02aa3328aba580b4187b4dac90a7ba3060f05683a861bb12066f49804efd3a56b1e571e6eb7af41e2d3127152470c31')

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
