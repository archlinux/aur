# Maintainer: Christopher Bero <bigbero@gmail.com>
pkgname=localplot-git
_pkgname=localplot
pkgver=191.a385ea9
pkgrel=2
pkgdesc="HPGL Plotting software to drive a serial vinyl cutter."
arch=('i686' 'x86_64')
url="https://github.com/makerslocal/localplot"
license=('GPL3')
#group=('')
depends=('qt5-serialport')
makedepends=('git' 'qt5-base')
optdepends=('inkscape: support importing svg and dxf files')
#noextract=('')
source=(${_pkgname}::"git+https://github.com/makerslocal/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

#prepare() {
#}

build() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
	git submodule update
	qmake -spec linux-g++ CONFIG+=release -o Makefile localplot.pro
	make
}

package() {
    install -D "$srcdir/localplot/localplot" "$pkgdir/usr/bin/localplot"
    install -D "$srcdir/localplot/localplot.desktop" "$pkgdir/usr/share/applications/localplot.desktop"
}
