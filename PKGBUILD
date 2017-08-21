# Maintainer: Max Bruckner <max at maxbruckner dot de>

pkgname=cjson
pkgver=1.5.8
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('693ad6e36cee162a256a05e151b270ed3c32d6e34be39f777334689dc1a21897e3d3cf2008e1eb717fce13a1a9863dc8fa2a9fb8a26809756e806db8b2ccc585')

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
