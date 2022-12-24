# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-annotations-git'
_extname='nautilus-annotations'
pkgver='r25.19d3bad'
pkgrel=1
pkgdesc='Annotate files and directories'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-annotations'
license=('GPL')
depends=('glib2' 'gtksourceview5' 'libnautilus-extension')
provides=("${_extname}")
conflicts=("${_extname}" "${_extname}-bin")
source=("git+https://gitlab.gnome.org/madmurphy/${_extname}.git")
install="${pkgname}.install"
sha256sums=('SKIP')

pkgver() {

	cd "${_extname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_extname}"
	./bootstrap --noconfigure

}

build() {

	cd "${srcdir}/${_extname}"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${_extname}"
	make DESTDIR="${pkgdir}" install

}

