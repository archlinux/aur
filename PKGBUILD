# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Stunts <f.pinamartins@gmail.com>
pkgname=staden-io_lib
_pkgname=io_lib
pkgver=1.14.14
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="DNA sequence assembly (Gap4) and editing and analysis tools (Spin)"
arch=('i686' 'x86_64')
url="https://github.com/jkbonfield/io_lib"
license=('BSD')
depends=('curl')
conflicts=('htscodecs')
provides=('htscodecs')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/io_lib-$_pkgver/io_lib-$pkgver.tar.gz)
sha256sums=('a471c79b9aede1776a895cb46fcb81b5d163d6ca9c3e1e33096346fef46d3598')

build() {
  cd "$srcdir/$_pkgname-$pkgver/htscodecs"
  autoreconf --force --install -v
  ./configure --prefix=/usr

  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf --force --install -v
  ./configure --prefix=/usr
  make CFLAGS=-g
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
