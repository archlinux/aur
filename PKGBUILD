# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-blazarclient
pkgver=4.1.0
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
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('0202463b083fb45b48d3aa15dc029c3d80cb22281d93ee882a4ab2109f9ac73bbda99ab54fb4a9115c08357cbdd9b2ea928dd44ae94983ed5b4689d884adf992')

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
