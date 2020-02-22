# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc
pkgver=0.1.0
pkgrel=2
pkgdesc='Fast and neat VNC server library'
arch=(x86_64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(libuv pixman gnutls)
makedepends=(meson ninja libdrm)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/neatvnc/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	arch-meson build -Dtls=enabled
	ninja -C build
}

package() {
	cd $pkgname-$pkgver
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
