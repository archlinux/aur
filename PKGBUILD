# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=cglm
pkgver=0.8.9
pkgrel=3
pkgdesc="OpenGL Mathematics (glm) for C"
arch=('x86_64')
url="https://github.com/recp/cglm"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/recp/cglm/archive/v$pkgver.tar.gz")
md5sums=('2efb9281410a3e923db49e433796c393')

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
