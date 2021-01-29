# Maintainer: Ollie Armstrong <ollie@armstrong.io>

pkgname=interception-ralt2hyper
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
license=('MIT')

pkgdesc='Interception plugin to remap Right Alt (commonly AltGr) to Hyper (i.e. Control, Alt and Super)'
url='https://gitlab.com/oarmstrong/ralt2hyper'
depends=('interception-tools')
makedepends=('git' 'cmake')

source=("${pkgname}::git+https://gitlab.com/oarmstrong/ralt2hyper.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cmake -B build \
		-S "${pkgname}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev
	cmake --build build
}

package() {
	install -Dm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 "${pkgname}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"

	cd build
	make DESTDIR="${pkgdir}/" install
}
