# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix von Perger <frekkvb@gmail.com>

pkgname=libthreadar
pkgver=1.4.0
pkgrel=1
pkgdesc='C++ library manage threads and any type to exception between them'
arch=('x86_64')
url='http://libthreadar.sourceforge.net/'
license=('LGPL3')
depends=('gcc-libs')
provides=('libthreadar.so')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2e4715178027bac973a4883f4bcb063494327ba886710446a82a80860f1a3791')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --disable-static --disable-build-html
	sed -i '/^test_barrier_LDFLAGS/s/-all-static//' -i doc/examples/Makefile{,.am,.in}
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" pkgdatadir="/usr/share/doc/$pkgname/html" install
	install -Dm644 AUTHORS README THANKS -t "$pkgdir/usr/share/doc/$pkgname/"
	rm -rf "${pkgdir}/usr/share/doc/dar/html/man"
}
