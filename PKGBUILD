# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: archlinux.info:tdy
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com>

pkgname=diorite-git
pkgver=4.20.0.r2.gc133fb6
pkgrel=1
pkgdesc="A utility and widget library for Nuvola Player project based on GLib, GIO, and GTK"
arch=(x86_64)
url="https://tiliado.eu/diorite"
license=(BSD)
depends=(gtk3 libgee sqlite libx11 gobject-introspection)
makedepends=(git vala)
provides=(diorite)
conflicts=(diorite)
source=('git+https://github.com/tiliado/diorite.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./waf distclean configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--no-vala-lint \
		--novaladoc \
		--no-strict
	./waf build -v -p
}

package() {
	cd "$srcdir/${pkgname%-git}"
	./waf install --destdir="$pkgdir"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
