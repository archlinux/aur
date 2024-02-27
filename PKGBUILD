# Maintainer: Pochang Chen <johnchen902@gmail.com>
pkgname=wlchewing-git
pkgver=v0.2.1.r0.2a02c6b
pkgrel=1
pkgdesc="Wayland Chinese zhuyin input method with libchewing "
arch=('x86_64')
url="https://github.com/xdavidwu/wlchewing"
license=('MIT')
depends=('wayland' 'cairo' 'pango' 'libchewing' 'libxkbcommon' 'systemd-libs')
makedepends=('meson' 'git' 'wayland-protocols')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/xdavidwu/wlchewing.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson . build
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	meson install -C build --destdir "$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
