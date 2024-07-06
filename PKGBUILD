# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=4.9.0
pkgrel=2
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
sha512sums=('e18d46cd072c5db18cde39c94ca5c46cf764a26ae5e770462615b64251fc7bcc9b6b72036ec592eecbf66b1fb7d761e6bb11e9a82fedf10c32c51de88ca98709')

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
