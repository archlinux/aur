# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=4.9.1
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
sha512sums=('5a2462bb20366fdb929d394111565fff0614d636a12f1c53f2ba422d0f055599c0ab64b363bb8065d50c73e37cca77081f1d5cc8dd24bd4baa0ca5e2d89f42c4')

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
