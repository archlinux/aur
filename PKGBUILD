# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=worldvu
pkgver=2.0.3
pkgrel=1
epoch=
pkgdesc="Text UI library and applications"
url="https://codeberg.org/dyfet/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL3')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
makedepends=('cmake>=3.1.0')
sha256sums=('0d00825c9ffe0fe0b78131b4bb7a44630657e2e0f96eff035c1443afc6c558cc') 

build() {
	cd "$srcdir/$pkgname"
	cmake \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
        -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	strip "$pkgdir"/usr/bin/* "$pkgdir"/usr/lib/*.so.*
	gzip "$pkgdir"/usr/share/man/man*/*
}
