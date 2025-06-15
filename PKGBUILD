# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=5.23
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/debianutils"
license=('GPL')
makedepends=('po4a')
depends=('run-parts')
source=("https://salsa.debian.org/debian/$pkgname/-/archive/debian/$pkgver/$pkgname-debian-$pkgver.tar.bz2")
sha512sums=('d435f5280748362a546505418d41943c8c51d8ed359e96ebb851eec1c64c7375e9e14d361ab8f4ba81373f2654bb561556fae5eb440c7140398b7908500a6f74')

build() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}"
  make DESTDIR="$pkgdir" install

  echo 'Remove files of "run-parts" package...'
  cd -
  find "${pkgdir}" -name run-parts* -delete
}
