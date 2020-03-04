# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc
pkgver=0.1.0
pkgrel=3
pkgdesc='Fast and neat VNC server library'
arch=(x86_64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(libuv pixman gnutls)
makedepends=(meson ninja libdrm)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/neatvnc/archive/v$pkgver.tar.gz")
sha512sums=('e53f630d878dc9c66a123d07261ccdf3a46ece8c77096b1e3bca9633406bc7c22c11ab7b1e7bae19e5b75e4d131dde78c5c25deb012286ee115269f8f1694911')

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
