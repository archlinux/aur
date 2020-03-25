# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: archlinux.info:tdy
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com>
pkgname=diorite-git
pkgver=4.16.0.r11.g74287ed
pkgrel=1
pkgdesc="A utility and widget library for Nuvola Player project based on GLib, GIO, and GTK"
arch=('x86_64')
url="https://tiliado.eu/diorite"
license=('BSD 2-Clause "Simplified"')
depends=('glib2' 'gtk3' 'libgee' 'sqlite' 'libx11' 'gobject-introspection')
makedepends=('git' 'waf' 'vala' 'python-pyparsing')
provides=("${pkgname%-git}" 'libdioritegtk4.so-64' 'libdioriteglib4.so-64' 'libdioritedb4.so-64')
conflicts=("${pkgname%-git}" 'libdioritegtk4' 'libdioriteglib4' 'libdioritedb4')
source=('git+https://github.com/tiliado/diorite.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	waf distclean configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--no-vala-lint \
		--novaladoc \
		--no-strict
	waf build -v -p
}

package() {
	cd "$srcdir/${pkgname%-git}"
	waf install --destdir="$pkgdir"
}
