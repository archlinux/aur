# # Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ryanvade
pkgname=gnome-shell-extension-hibernate-status-git
pkgver=1.9.r1.gc14c68d
pkgrel=1
pkgdesc="GNOME Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/arelange/gnome-shell-extension-hibernate-status.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# Extension won't detected compiled schemas in /usr/share/glib-2.0/schemas
	glib-compile-schemas schemas
}

package() {
	_uuid='hibernate-status@dromi'

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 schemas/*.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 schemas/*.compiled -t \
		"$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
	install -m644 *.js *.json -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
