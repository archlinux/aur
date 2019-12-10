# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-web-shortcuts-extension-git
pkgver=r16.2d89c1e
pkgrel=2
pkgdesc="Adds a 'Create web link...' menu item to Nautilus, which makes it simple to create URL shortcut files in directories"
arch=('any')
url="https://gitlab.gnome.org/sthursfield/gnome-web-shortcuts-extension"
depends=('nautilus' 'firefox')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("git+https://gitlab.gnome.org/sthursfield/gnome-web-shortcuts-extension.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
