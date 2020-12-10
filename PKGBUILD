# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=fhex-git
pkgver=v2.4.1.r1.gbeadf69
pkgrel=1
pkgdesc="A full-featured hex editor"
arch=(x86_64)
url="https://github.com/echo-devim/fhex"
license=('GPLv3')
depends=(qt5-base qt5-charts capstone keystone)
source=(
	"git+https://github.com/echo-devim/fhex.git"
	"fhex.desktop"
)
sha512sums=(
	SKIP
	89756a938066c51092df1c75e976ea75e2a99924d1a1f7e5de2621a4f9dee081d07e458c13585adae71206caa41e1134f5b3c097fd9b3e8079cf5671054b4c30	
)
pkgver() {
	cd fhex
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd fhex
	qmake .
}

build() {
	cd fhex
	make -j
}
package() {
	install -Dm 755 "${srcdir}"/fhex/fhex -t "${pkgdir}"/usr/bin/
	install -Dm 644 "${srcdir}"/fhex.desktop -t "${pkgdir}"/usr/share/applications/
	cd "${srcdir}"/fhex
	mv icon.png fhex.png
	install -Dm 644 "${srcdir}"/fhex/fhex.png -t "${pkgdir}"/usr/share/pixmaps/
}
