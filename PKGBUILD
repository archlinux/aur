# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl-git
pkgver=0.2.r5.15f5d31
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots')
makedepends=('git' 'wayland-protocols')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# use #branch=wlroots-next to build against wlroots-git
source=('git+https://github.com/djpohly/dwl')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr/" install
}
