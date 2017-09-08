# Maintainer: Max Bruckner <max at maxbruckner dot de>

pkgname=cjson
pkgver=1.5.9
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('3dbca7791787f5cf3a7752a7f9e099ac62f444cd8452c8df3a792cd1f6b2360145c1a8f3b1bc3784b196719dda88c08372712ed18fccda06c76a42059727a37a')

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
