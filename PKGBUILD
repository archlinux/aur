# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Stunts <f.pinamartins@gmail.com>
pkgname=staden-io_lib
_pkgname=io_lib
pkgver=1.14.15
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
sha256sums=('20814c4365e1e2fe6630fb11d0df370dec4c5688af3871de7f1cb0129671401e')

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
