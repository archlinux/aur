# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-gnome-ui-tune-git
pkgver=1.2.0.r5.gf13950d
pkgrel=1
pkgdesc="Tunes the overview UI of GNOME 40"
arch=('any')
url="https://github.com/axxapy/gnome-ui-tune"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/axxapy/gnome-ui-tune.git')
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/gnome-ui-tune
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/gnome-ui-tune
	_uuid='gnome-ui-tune@itstime.tech'

	install -Dm644 *.js *.json -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	cp -r schemas src "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$pkgdir/usr/share/glib-2.0/schemas"
	ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.shell.extensions.gnome-ui-tune.gschema.xml" \
		"$pkgdir/usr/share/glib-2.0/schemas"
}
