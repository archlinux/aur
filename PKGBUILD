# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.8.5
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://github.com/clibs/clib
license=(MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('2fe496c97181333c6674250bae6c30d6116ba9e8bb1622130ae457cd0c6ea22745924055535d4bb00f7212621d4ce96d574b9821f8d119457aae7b8f8a7c2587')

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
