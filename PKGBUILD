# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-bluetooth-git'
_pkgname='nautilus-bluetooth'
pkgver='r4.bd46d9d'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('any')
url="https://github.com/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
makedepends=('pkgconf' 'intltool')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("git+https://github.com/madmurphy/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {

	cd "${_pkgname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_pkgname}"
	./autogen.sh --noconfigure
	./configure --prefix=/usr

}

build() {

	cd "${srcdir}/${_pkgname}"
	make

}


check() {

	cd "${srcdir}/${_pkgname}"
	make check

}

package() {

	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install

}

