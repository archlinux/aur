# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.7.0
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://www.clibs.org
license=(custom:MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha512sums=('32168f924e788206f1c4c067fdcdc22ceeb02905fabeb74d81d94f5b452793b06901dbac793f65332e009241ae6712a8aa47c3ad755ba4a35429b1ef215675f3')

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
