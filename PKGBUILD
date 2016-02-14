# Maintainer: 910JQK <v910JQK@gmail.com>
_pkgname=cubway
pkgname=$_pkgname-git
pkgver=r122.b689803
pkgrel=3
pkgdesc='WebApp container implemented by QtWebkit, which provides some JavaScript API.'
arch=('i686' 'x86_64')
url='https://github.com/Icenowy/Cubway'
depends=('qt5-base' 'qt5-webkit' 'libqtxdg')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('cubway')
source=('cubway::git+https://github.com/Icenowy/Cubway.git' 'https://cirno.xyz/~jqk/files/Babel.tar.gz')
md5sums=('SKIP' 'bf23c4f0cec5f235617c5fa9ee02cc91')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir build build_xdg
	cd build
	cmake ..
	make
	cd ../build_xdg
	cmake ../Modules/Xdg
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/opt/Subway/Cubway/Modules/"
	install -m755 -d "${pkgdir}/opt/Subway/Cubway/Modules/Xdg"
	install -m755 build/cubway "${pkgdir}/opt/Subway/Cubway/"
	install -m644 build_xdg/libXdg.so "${pkgdir}/opt/Subway/Cubway/Modules/Xdg/"
	cd "${srcdir}"
	install -m644 babel.js browser-polyfill.js "${pkgdir}/opt/Subway/Cubway/"
}
