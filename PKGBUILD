# Maintainer: Nathan Isom <Nahanisom27 at gmail [dot] com >
# derived from st-git aur package.

_pkgname=shit
pkgname=${_pkgname}-git
pkgver=20160407.74c6832
pkgrel=1
pkgdesc='st fork'
url='https://github.com/neeasade/shit'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("git://github.com/neeasade/${_pkgname}.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "st")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
