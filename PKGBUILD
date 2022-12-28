# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_extname='nautilus-checksums'
pkgname="${_extname}-git"
pkgver='r1.6474434'
pkgrel=1
pkgdesc='Add checksums to Nautilus'\'' properties window'
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/madmurphy/${_extname}"
license=('GPL')
depends=('glib2' 'libnautilus-extension')
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

