# Maintainer: Ye Jingchen <ye[dot]jingchen[at]gmail[dot]com>
pkgname=uvw
pkgver=2.9.0_libuv_v1.41
pkgrel=1
pkgdesc="Header-only, event based, tiny and easy to use libuv wrapper in modern C++"
arch=(x86_64)
url="https://github.com/skypjack/uvw"
license=('MIT')
depends=('libuv>=1.41.0' 'libuv<1.42.0')
makedepends=(cmake)
source=("uvw::git+https://github.com/skypjack/uvw.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cmake -S "$pkgname" -B build -Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DFETCH_LIBUV=OFF \
		-DUSE_LIBCPP=OFF
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/uvw/LICENSE" "$pkgdir/usr/share/licenses/uvw/LICENSE"
}
