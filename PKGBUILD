# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.1.13
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://github.com/clibs/clib
license=(custom:MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha512sums=('14b6a0fa7495cdb08434e76226579e5f68362ab1dab88b85b4bb16555d1bd2e29892feea375773c755023fdaf7c4ead7ac9732d8f90ceeaaedd22c2c47d57bb7')

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
