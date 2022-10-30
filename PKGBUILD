# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-bluetooth-git'
_extname='nautilus-bluetooth'
pkgver='r20.c9908a8'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
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

