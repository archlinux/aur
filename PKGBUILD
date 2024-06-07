# Maintainer: Thomas Krug <phragment@elektronenpumpe.de>
pkgname=wlr-dpms-git
pkgver=r17.d0e6412
pkgrel=1
pkgdesc="change output power modes in wlroots compositors"
arch=('x86_64')
url="https://sr.ht/~dsemy/wlr-dpms/"
license=('MIT')
depends=('wayland')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sr.ht/~dsemy/wlr-dpms')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    unset CFLAGS
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


