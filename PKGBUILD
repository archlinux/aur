# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_pkgname=Xarcade2Jstick
pkgname=xarcade2jstick-git
pkgver=r70.0cb523c
pkgrel=1
pkgdesc='Maps XArcade sticks to joysticks.'
arch=('i686' 'x86_64')
url="https://github.com/petrockblog/${_pkgname}"
license=('custom:MPL2')
provides=('xarcade2jstick')
conflicts=('xarcade2jstick')
makedepends=('git' 'cmake')
source=("git+https://github.com/petrockblog/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	make DESTDIR="${pkgdir}"
}

package() {
	cd ${_pkgname}
	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" installservice
	mv "${pkgdir}/lib" "${pkgdir}/usr/"
}
