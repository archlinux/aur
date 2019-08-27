# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='nautilus-bluetooth-git'
_pkgname='nautilus-bluetooth'
pkgver='r1.81e72b5'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('any')
url="https://github.com/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
makedepends=('pkgconf' 'intltool')
provides=("${pkgname}")
conflicts=("${pkgname}")
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

