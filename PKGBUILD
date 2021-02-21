# Maintainer: Philippe Cherel <philippe.cherel@mayenne.org>

_srcname=gnome-shell-TilixDropdown
pkgname=gnome-shell-extension-tilix-dropdown-git
pkgver=7+7+g31645e1
pkgrel=1
pkgdesc="A GNOME Shell extension to launch Tilix (previously known as terminix) in Quake Mode ."
arch=('any')
url="https://extensions.gnome.org/extension/1515/tilix-quake/"
license=('GPL')
depends=('gnome-shell' 'tilix')
makedepends=('git')
provides=('gnome-shell-extension-tilix-dropdown')
groups=('gnome-shell-extensions')
source=("git+https://github.com/ivoarch/${_srcname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_srcname}"
	git describe --tags --long | sed 's/^v//; s/-/+/g'
}

package() {
	cd "${_srcname}"
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

	install -dm755 "$destdir"

	cp -r * "$destdir"
}

