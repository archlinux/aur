# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=4.9.0
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
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('49c206cfc9a57782e4edb48c236d50acc2a8966558b18e041feee3532b68148037a3c4e55f7bd2deaf1b3c9d2a3707c7bd32a3cc7311ffb99a2d08d2aead3a07')

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
