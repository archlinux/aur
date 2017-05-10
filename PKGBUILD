# Maintainer: Max Bruckner <max at maxbruckner dot de>

pkgname=cjson
pkgver=1.5.2
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('c6f0b94a5a918db62a14f58e09baf72e5f00c7e454d11028988f80139f0f6fdd5f78b41f89b74a291ab75bd41b61036d55955a5af87038bb91c5cd8c2e3e50bb')

build() {
	cd "$srcdir/cJSON-$pkgver" || return 1

	rm -rf build
	mkdir build
	cd build || return 1
	cmake .. -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr
	make || return 1
}

check() {
	cd "$srcdir/cJSON-$pkgver/build" || return 1
	make check || return 1
}

package() {
	cd "$srcdir/cJSON-$pkgver/build" || return 1

	make DESTDIR="$pkgdir" install || return 1

	# install license files
	install -Dm644 "$srcdir/cJSON-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
