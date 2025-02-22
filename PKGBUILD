# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=cglm
pkgver=0.9.6
pkgrel=1
pkgdesc="OpenGL Mathematics (glm) for C"
arch=('x86_64')
url="https://github.com/recp/cglm"
license=('MIT')
makedepends=('cmake')
provides=('libcglm.so=0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/recp/cglm/archive/v$pkgver.tar.gz")
md5sums=('20539189bbf2b4b791554ad85f3eb451')

build() {
	cd "$pkgname-$pkgver"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release
	cmake --build build --config release
}

package() {
	cd "$pkgname-$pkgver"
	make -C build DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/licenses/cglm/"
	install LICENSE "$pkgdir/usr/share/licenses/cglm/"
	install -d "$pkgdir/usr/lib/pkgconfig/"
	install build/cglm.pc "$pkgdir/usr/lib/pkgconfig/"
}
