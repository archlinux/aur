# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Stunts <f.pinamartins@gmail.com>
pkgname=staden-io_lib
_pkgname=io_lib
pkgver=1.14.13
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
sha256sums=('5641c02f98342f689274ed9b71e57d26fbf8216730619bde3a663214ce2ae8b0')

build() {
  cd "$srcdir/$_pkgname-$pkgver/htscodecs"
  aclocal --force
  autoreconf --force --install
  automake --force
  ./configure --prefix=/usr

  cd "$srcdir/$_pkgname-$pkgver"
  aclocal --force
  autoreconf --force --install
  automake --force
  ./configure --prefix=/usr
  make CFLAGS=-g
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
