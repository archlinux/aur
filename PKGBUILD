# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: martinjlowm <martin {at} martinjlowm {dot} dk>

pkgname=zuki-themes-git
pkgver=r316.460cabb
pkgrel=1
pkgdesc="A selection of themes for GTK3, gnome-shell and more."
arch=(any)
url=https://github.com/lassekongo83/zuki-themes
license=(GPL3)
depends=(gtk-engine-murrine gtk-engines)
makedepends=(git meson ninja sassc)
conflicts=(zukitwo-themes zuki-themes)
provides=(zuki-themes)
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')

source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
   	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	rm -rf build
	arch-meson "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
