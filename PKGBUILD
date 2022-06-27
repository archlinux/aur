# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.8.1
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://www.clibs.org
license=(custom:MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha512sums=('62476cadb1c70463bdabf13125778a5f246f2037012a207b6593f2b28cd8149ebaa463cc4a162dc69f77409e27a5896c182865defd4ed28edf313172fa411611')
b2sums=('9c457bba8b679cad161efb46344dd324835ef083e8db1d8a4b24d13d57b0c399239f6135f5a7b41914815d855332a4c18bb3b570753ff9e6221104a82078caca')

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
