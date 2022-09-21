# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=simple-diary-gtk
pkgname=${_pkgname}-git
pkgver=r86.ecadcc5
pkgrel=2
pkgdesc='Simple and lightweight diary app'
arch=('x86_64')
url='https://github.com/johan-bjareholt/simple-diary-gtk'
license=('GPL3')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('libhandy' 'md4c' 'webkit2gtk' 'gtkmdview')
makedepends=('appstream-glib' 'meson' 'git')
source=("git+https://github.com/johan-bjareholt/simple-diary-gtk.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
