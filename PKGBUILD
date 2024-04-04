pkgname=libcuba
pkgver=4.2.2
pkgrel=1
pkgdesc='A library for mutidimensional numerical integration'
arch=('x86_64')
url="https://feynarts.de/cuba/"
license=('LGPL')
makedepends=('make' 'automake' 'gcc')
options=('staticlibs' '!lto')
#source=("https://feynarts.de/cuba/Cuba-$pkgver.tar.gz")
#sha256sums=('8d9f532fd2b9561da2272c156ef7be5f3960953e4519c638759f1b52fe03ed52')
source=("https://github.com/jschueller/cuba/archive/refs/heads/main.zip")
sha256sums=("SKIP")


build() {
  #cd "$srcdir/Cuba-$pkgver"
  cd cuba-main
  CFLAGS="-fPIC ${CFLAGS}" ./configure --prefix=/usr
  make -j1
}

check() {
  #cd "$srcdir/Cuba-$pkgver"
  cd cuba-main
  make -k check -j1
}

package() {
  #cd "$srcdir/Cuba-$pkgver"
  cd cuba-main
  make install -j1 DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/bin
}
