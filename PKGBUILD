# Maintainer: Erick Gallesio <eg at stklos net>
# Contributor: Jorge Silva <j0rj@posteo.net>

pkgname=stklos
pkgver=26.0
pkgrel=2
pkgdesc="Free R7RS Scheme system."
arch=('i686' 'x86_64')
url="http://www.stklos.net"
license=('GPL-2.0-or-later')
depends=('gmp' 'pcre2' 'libffi' 'gc')
optdepends=('readline: line editing and history support')
source=("http://www.stklos.net/download/$pkgname-$pkgver.tar.gz"
       "stklos-26.0.patch")
md5sums=('1518d5f5d96a65d25e75bea603346273' '51b4199861a56b342b68bf4161a88e8c')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 --input="${srcdir}/stklos-26.0.patch"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="-O3 -Wall -Wextra -fhardened" LDFLAGS="-z relro -z now" ./configure --enable-threads --prefix=/usr 
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
