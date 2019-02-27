# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=argdata
pkgver=0.8
pkgrel=1
pkgdesc="binary serialisation format inspired by YAML, MessagePack and nvlists"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('BSD')
depends=()
makedepends=('cmake')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/argdata/archive/v$pkgver.tar.gz")
sha512sums=('89d7bc75e4c98e4272e6822e0b2c4c84e1adcceaa051f053d63ba46cafa1cdbb0cdeba530ee3d130e942a588d364890321e006f842a6714d81db34df42c3487a')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/CONTRIBUTORS"
}
