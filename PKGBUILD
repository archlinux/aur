# Maintainer: Erick Gallesio <eg at stklos net>
# Contributor: Jorge Silva <j0rj@posteo.net>

pkgname=stklos
pkgver=2.00
pkgrel=3
pkgdesc="Free R7RS Scheme system."
arch=('i686' 'x86_64')
url="http://www.stklos.net"
license=('GPL')
depends=('readline' 'gmp' 'pcre' 'libffi' 'gc')
source=("http://www.stklos.net/download/$pkgname-$pkgver.tar.gz" "stklos-2.00.patch")
md5sums=('8eb4b2edad1b77cedd16b0833ea4dad7' '03b6f898179eaf896a68999877793550')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/stklos-2.00.patch"
}

build() {
  cd "$pkgname-$pkgver"
  LDFLAGS="" ./configure --prefix=/usr \
                         --enable-threads=pthreads
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
