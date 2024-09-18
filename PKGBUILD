# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=5.20
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/debianutils"
license=('GPL')
makedepends=('po4a')
depends=('run-parts')
source=("https://salsa.debian.org/debian/$pkgname/-/archive/debian/$pkgver/$pkgname-debian-$pkgver.tar.bz2")
sha512sums=('0252fde90911df685cd585b91cde48f48f84d42982582839f83de5f57033d1241cc05bac95f89275fbb0fa80e6626111c2212641447d5a37ffe9c0d1027a7824')

build() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}"
  make DESTDIR="$pkgdir" install

  msg 'Remove files of "run-parts" package...'
  cd -
  find "${pkgdir}" -name run-parts* -delete
}
