# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-oslotest
pkgver=4.5.0
pkgrel=3
pkgdesc="Oslo test framework"
arch=('any')
url="https://github.com/openstack/oslotest"
license=('Apache')
depends=('python38-fixtures' 'python38-subunit' 'python38-stestr' 'python38-testscenarios'
         'python38-testtools' 'python38-mox3' 'python38-os-client-config'
         'python38-debtcollector')
makedepends=('python38-pbr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/oslotest/archive/$pkgver.tar.gz")
sha512sums=('f00c6a99368f20f9e70b1156cbcd5206c63db13286f3939e15816aae2dce80bb81dd8047e57fb0e41124f7590bc514644ec87457337b2992d77aa67ed3f3efb4')

export PBR_VERSION=$pkgver

build() {
  cd oslotest-$pkgver
  python3.8 setup.py build
}

check() {
  cd oslotest-$pkgver
  stestr run
}

package() {
  cd "$srcdir"/oslotest-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
