# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_libname='libgnuisance'
pkgname="${_libname}-git"
pkgver='r2.05fb082'
pkgrel=1
pkgdesc='GTK New User Interfaces'
arch=('i686' 'x86_64')
url="https://madmurphy.github.io/${_libname}"
license=('GPL')
depends=('glib2' 'libadwaita' 'gtk4')
makedepends=('gtk-doc')
conflicts=("${_libname}" "${_libname}-bin")
provides=("${_libname}")
source=("git+https://github.com/madmurphy/${_libname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_libname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_libname}"
	./bootstrap --noconfigure
}

build() {
	cd "${srcdir}/${_libname}"
	./configure --prefix=/usr --enable-gtk-doc
	make
}

package() {
	cd "${srcdir}/${_libname}"
	make DESTDIR="${pkgdir}" install
}

