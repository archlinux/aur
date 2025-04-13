# Maintainer: wadledee <wadledee@pm.me>
pkgname="hyprsysteminfo"
pkgver=0.1.3
pkgrel=3
pkgdesc="A tiny qt6/qml application to display information about the running system"
arch=(any)
url="https://github.com/hyprwm/hyprsysteminfo"
license=('BSD-3-Clause')
depends=('hyprutils' 'hyprland-qt-support')
makedepends=('git' 'cmake' 'gcc')
source=("https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
provides=("hyprsysteminfo")
conflicts=("${pkgname}-git")
sha256sums=('359298d926e0a9ec670ff5b5100c1d08392a85126ea1d8f89f723d634fd218ce')

build() {
 	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
	cmake --build ./build --config Release --target hyprsysteminfo
}

package() {
 	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
