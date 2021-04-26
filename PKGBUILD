# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-hide-git'
_extname='nautilus-hide'
pkgver='r2.a7df1c3'
pkgrel=1
pkgdesc='A simple Nautilus extension that adds "Hide" and "Unhide" to Nautilus right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-hide'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
makedepends=('intltool')
provides=("${_extname}")
conflicts=("${_extname}" "${_extname}-bin")
source=("git+https://gitlab.gnome.org/madmurphy/${_extname}.git")
install="${_extname}.install"
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

