# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=2.8.0
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url=https://www.clibs.org
license=(custom:MIT)
depends=(curl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha512sums=('965bbc2d66a8279009d6647be0c4aec8c2d61d11371a256eb8fc52152ed6d198243026f90c7651bdabcad6604b776b7a7a2f2d90843138d103ddc4c3b11c4961')
b2sums=('987d96dc2d49f49f533d68e4998a767a3b794a046cbf91a4956425a88c5010d0759f40506b9f1f493d84cfbfe9b3b2406c7e110c83fa34a6b5636192c24670bb')

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
