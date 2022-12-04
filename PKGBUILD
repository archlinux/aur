# Maintainer: surefire@cryptomile.net

pkgname=gnome-shell-extension-quake-mode-git
pkgver=8+1+gd300dfd
pkgrel=1
pkgdesc='Adds support quake-mode for any application'
arch=('any')
url='https://github.com/repsac-by/gnome-shell-extension-quake-mode'
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-quake-mode')
provides=('gnome-shell-extension-quake-mode')
groups=('gnome-shell-extensions')
source=('git+https://github.com/repsac-by/gnome-shell-extension-quake-mode.git')
sha256sums=('SKIP')

_uuid=quake-mode@repsac-by.github.com

pkgver() {
	cd gnome-shell-extension-quake-mode
	git describe --long --tags | sed 's/^v//;s/-/+/g'
}

build() {
	cd gnome-shell-extension-quake-mode
	gnome-extensions pack --force --extra-source={quakemodeapp,indicator,util}.js "$_uuid"
}

package() {
	cd gnome-shell-extension-quake-mode

	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$destdir"
	bsdtar -C "$destdir" --exclude schemas -xf "$_uuid.shell-extension.zip"

	install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" "$_uuid/schemas/com.github.repsac-by.quake-mode.gschema.xml"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
