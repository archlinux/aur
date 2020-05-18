# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp
pkgver=0.6.0
pkgrel=1
pkgdesc='Minimalist, fast, cross-platform terminal emulator'
arch=('x86_64')
url='https://terminalpp.com'
license=('MIT')
depends=('libxft' 'hicolor-icon-theme')
makedepends=('gcc8' 'imagemagick' 'cloc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/terminalpp/terminalpp/archive/v${pkgver}.tar.gz")
sha256sums=('cfa2339df695be43da340d142352bdb4a5c02cd8049b761aae9383b233269c16')

build() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build/release
	cd build/release
	cmake ../.. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 -DPACKAGE_INSTALL=terminalpp
	cmake --build . --target packages
	cmake ../.. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 -DPACKAGE_INSTALL=tpp-ropen
	cmake --build . --target packages
	cmake ../.. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 -DPACKAGE_INSTALL=tpp-bypass
	cmake --build . --target packages
	make

}

package() {
	cd "${pkgname}-${pkgver}/build/release"
	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: