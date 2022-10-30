# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>

_extname='nautilus-launch'
pkgname="${_extname}-git"
pkgver='r12.a84e722'
pkgrel=1
pkgdesc='A simple Nautilus extension that allows to run executables and launchers via right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-launch'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
conflicts=("${_extname}" "${_extname}-bin")
source=("git+https://gitlab.gnome.org/madmurphy/${_extname}.git")
install="${pkgname}.install"
md5sums=('SKIP')

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

