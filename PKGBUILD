# Maintainer: Nathan Isom <Nahanisom27 at gmail [dot] com >
# derived from st-git aur package.

_pkgname=xst
pkgname=${_pkgname}-git
epoch=1
pkgver=0.8.4.1.r34.g293b895
pkgrel=1
pkgdesc='st fork fork with xresources support and other patches'
url='https://github.com/neeasade/xst'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("git+https://github.com/gnotclub/${_pkgname}.git")
sha1sums=('SKIP')

provides=(
	${_pkgname}
)
conflicts=(
	"${_pkgname}"
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make clean
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 readme.org "${pkgdir}/usr/share/doc/${pkgname}/README"
}
