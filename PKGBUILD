# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=5.1.0
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
sha512sums=('00fc2256c0ca0cfb4ed042a818f50199dbe3eb3f765b5dcb07163319f4d2719d6c0cce20a6f78812e1f12ca0ee653d9d6948aee9b13debdc66c23031e8d38ee6')

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
