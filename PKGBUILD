# Maintainer: éclairevoyant
# Contributor: Philip Goto <philip dot goto at gmail.com>

_pkgname=adwaita-icon-theme
pkgname="$_pkgname-git"
pkgver=43.r60.g4f8e8dc69
pkgrel=1
pkgdesc='GNOME standard icons'
arch=('any')
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=('LGPL3' 'CCPL:by-sa')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'librsvg')
makedepends=('git' 'gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	autoreconf -fvi
}

build() {
	cd $_pkgname
	./configure --prefix=/usr
	make
}

check() {
	make -C $_pkgname check
}

package() {
	make -C $_pkgname DESTDIR="$pkgdir" install
}
