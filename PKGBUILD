# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=5.22
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/debianutils"
license=('GPL')
makedepends=('po4a')
depends=('run-parts')
source=("https://salsa.debian.org/debian/$pkgname/-/archive/debian/$pkgver/$pkgname-debian-$pkgver.tar.bz2")
sha512sums=('076b23eea601f5388fe1b0d329105f0b840694f9201c06e57c49032271286e16e4d6c6ab32be649cf69f43a02a9ae8b07e493d3cb9c45146a14e3e93985f2b5b')

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
