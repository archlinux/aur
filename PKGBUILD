# Maintainer: George Katev <george_kate[at]hotmail[dot]com>

_pkgname=evolution-tray
pkgname=${_pkgname}-git
pkgver=r181.1ed10e5
pkgrel=1
pkgdesc="Evolution mail tray icon, using StatusNotifierItem"
arch=('any')
license=('GPL2')
depends=('evolution' 'libdbusmenu-glib')
makedepends=('git' 'meson')
source=('git+https://github.com/gkatev/evolution-tray.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	arch-meson ${_pkgname} build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
