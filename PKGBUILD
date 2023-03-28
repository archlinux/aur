# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.8.3
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://www.clibs.org
license=(custom:MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
b2sums=('5334967d51d3109f6d85908dbb876a261ebe70adbc91d80c8e8460830f579033dea5e173cd450668f38b59ba632792aa8e02bef5d4950a2ac1fc4479ad1356f7')

prepare () {
  cat >> "$srcdir/$pkgname-$pkgver/Makefile" <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS} -Wl,--as-needed
	EOF
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
