# Maintainer: Nathan Isom <Nahanisom27 at gmail [dot] com >
# derived from st-git aur package.

_pkgname=xst
pkgname=${_pkgname}-git
pkgver=20180816.1c9a2e8
pkgrel=1
pkgdesc='st fork'
url='https://github.com/neeasade/xst'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("git://github.com/gnotclub/${_pkgname}.git")
sha1sums=('SKIP')

provides=(
	'st'
	${_pkgname}
)
conflicts=(
	"${_pkgname}"
)

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
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
