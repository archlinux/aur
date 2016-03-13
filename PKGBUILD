# Maintainer: Christopher Bero <bigbero@gmail.com>
pkgname=localplot-git
_pkgname=localplot
pkgver=23.5535df2
pkgrel=1
pkgdesc="HPGL Plotting software to drive a serial vinyl cutter."
arch=('i686' 'x86_64')
url="https://github.com/makerslocal/localplot"
license=('GPL3')
#group=('')
depends=('qt5-serialport')
makedepends=('git' 'qt5-base')
#optdepends=('')
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
	/usr/lib/qt/bin/qmake -spec linux-g++ CONFIG+=release -o Makefile localplot.pro
	make
}

package() {
    install -D "$srcdir/localplot/localplot" "$pkgdir/usr/bin/localplot"
    install -D "$srcdir/localplot/localplot.desktop" "$pkgdir/usr/share/applications/localplot.desktop"
}
