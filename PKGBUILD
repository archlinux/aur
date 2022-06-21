# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=gtkmdview
pkgname=${_pkgname}-git
pkgver=r9.e80a9b6
pkgrel=2
pkgdesc='A simple library that renders markdown as a GtkWidget for viewing.'
arch=('x86_64')
url='https://github.com/johan-bjareholt/gtkmdview/'
license=('GPL3')
depends=('md4c' 'gtk4')
makedepends=('meson' 'git')
source=("https://github.com/johan-bjareholt/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
source=("git+https://github.com/johan-bjareholt/${_pkgname}")
sha256sums=('SKIP')
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
