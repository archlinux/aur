# Maintainer: surefire@cryptomile.net

pkgname=gnome-shell-extension-shelltile-git
pkgver=0+19+g569ddba
pkgrel=2
pkgdesc='A tiling window extension for GNOME Shell'
arch=('any')
url='https://extensions.gnome.org/extension/657/shelltile/'
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-shelltile')
provides=('gnome-shell-extension-shelltile')
groups=('gnome-shell-extensions')
source=('git+https://github.com/emasab/shelltile.git')
sha256sums=('SKIP')

pkgver() {
	cd shelltile

	printf '0+%s+g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
	cd shelltile

	local uuid='ShellTile@emasab.it'
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

	install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas"         schemas/*.xml

	install -Dm644 -t "$destdir" *.js *.json *.css
	find locale -type f -name '*.mo' \
		-exec cp --parents -dpt "$destdir" {} +
}
