# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=cglm
pkgver=0.8.3
pkgrel=1
pkgdesc="OpenGL Mathematics (glm) for C"
arch=('x86_64')
url="https://github.com/recp/cglm"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/recp/cglm/archive/v$pkgver.tar.gz")
md5sums=('b90aaa3c457b972f8d229bd5917713e3')

build() {
	cd "$pkgname-$pkgver"
	sh autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/licenses/cglm/"
	install LICENSE "$pkgdir/usr/share/licenses/cglm/"
	install -d "$pkgdir/usr/lib/pkgconfig/"
	install cglm.pc "$pkgdir/usr/lib/pkgconfig/"
}
