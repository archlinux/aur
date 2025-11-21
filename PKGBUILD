# Contributor:  Swift Geek
# Maintainer: Walter Casanova - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# indent = tab
# tab-size = 4

pkgname=seamly2d-git
_pkgname=Seamly2D
pkgver=v0.6.0.1.r2186.g94c2a386b9
pkgrel=1
pkgdesc="Open source patternmaking software to democratize fashion"
arch=('i686' 'x86_64')
url="https://seamly.net"
license=('GPL3')
depends=('qt6-svg' 'poppler' 'desktop-file-utils' 'qt6-5compat')
makedepends=('git' 'qt6-tools')
source=("git+https://github.com/FashionFreedom/Seamly2D.git#branch=develop")
b2sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	[ ! -e build ] && mkdir build
	cd build
	export QT_SELECT=6
	qmake6  PREFIX=/usr/ PREFIX_LIB=/usr/lib/ ../Seamly2D.pro -r \
	CONFIG+=noDebugSymbols CONFIG+=no_ccache CONFIG+=noTests CONFIG+=noRunPath
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	INSTALL_ROOT="$pkgdir/" make install
}
