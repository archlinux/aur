# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Joshua Huber <youremail@domain.com>

pkgname=gnome-shell-extension-lan-ip-address-git
_pkgname=lan-ip-address
pkgver=r15.391f4eb
pkgrel=1
pkgdesc="Simple extension to show your LAN IP address on the GNOME panel"
arch=('any')
url="https://github.com/Josholith/gnome-extension-lan-ip-address"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
source=("$_pkgname::git+https://github.com/Josholith/gnome-extension-lan-ip-address.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	./make.sh
}

package() {
	_uuid='lan-ip-address@mrhuber.com'
	cd "$_pkgname"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	bsdtar -xvf $_pkgname.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}