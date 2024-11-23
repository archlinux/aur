# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.8.7
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://github.com/clibs/clib
license=(MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a5494c7233fe8474b686f87277d84836d6f68d9e6642d932524eaa3b4874ddf2db4f16f5a157b7c05ddc04099fb30dd37aaa8b5e646b605176d1a141d64ca758')

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
