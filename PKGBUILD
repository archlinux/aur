# Maintainer: Adam Brunnmeier <adam.brunnmeier@gmail.com>
pkgname=wl-clipboard-git
pkgver=r58.24c74ba
pkgrel=2
pkgdesc="Command-line copy/paste utilities for Wayland"
arch=('i686' 'x86_64')
url="https://github.com/bugaevc/wl-clipboard"
license=('GPL')
depends=('wayland' 'xdg-utils')
makedepends=('git' 'meson' 'wayland-protocols')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/bugaevc/wl-clipboard")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson build
	cd build
	ninja
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 build/src/wl-copy "$pkgdir/usr/bin/wl-copy"
	install -Dm755 build/src/wl-paste "$pkgdir/usr/bin/wl-paste"
	install -Dm644 -t "$pkgdir/usr/share/man/man1" data/wl-*.1
}
