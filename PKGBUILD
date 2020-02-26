# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=cglm
pkgver=0.7.0
pkgrel=1
pkgdesc="OpenGL Mathematics (glm) for C"
arch=('x86_64')
url="https://github.com/recp/cglm"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/recp/cglm/archive/v$pkgver.tar.gz")
md5sums=('a6f556e6dd1804d4bcb0cba3c848fe9f')

build() {
	cd "$pkgname-$pkgver"
	sh autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	cp -a include/cglm/* "$pkgdir/usr/include/cglm/" # work around missing header file not copied with make install
	install -d "$pkgdir/usr/share/licenses/cglm/"
	install LICENSE "$pkgdir/usr/share/licenses/cglm/"
	install -d "$pkgdir/usr/lib/pkgconfig/"
	install cglm.pc "$pkgdir/usr/lib/pkgconfig/"
}
