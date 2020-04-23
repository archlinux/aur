# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='icon-library'
pkgver='0.0.6'
pkgrel='1'
pkgdesc="Symbolic icons for your apps"
changelog='CHANGELOG'
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/${pkgname}"
license=('GPL3')
depends=('libhandy' 'gdk-pixbuf2' 'gtksourceview4')
makedepends=('rust' 'meson' 'git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver () {
	cd ${pkgname}
	git describe --tags | sed 's/-/.r/; s/-/./'
}

build () {
	arch-meson ${pkgname} build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
