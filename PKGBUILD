# Maintainer: alvinshotjuicebo <alvinsh0tjuiceb0x@icloud.com>
pkgname="hyprsysteminfo"
pkgver=0.1.2
pkgrel=1
pkgdesc="A tiny qt6/qml application to display information about the running system"
arch=(any)
url="https://github.com/hyprwm/hyprsysteminfo"
license=('BSD-3-Clause')
depends=('hyprutils' 'qqc2-desktop-style')
makedepends=('git' 'cmake' 'gcc')
source=("https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
provides=("hyprsysteminfo")
conflicts=("${pkgname}-git")
sha256sums=('c0d383487a20bc811a36a17542adf5a91cc877e182504dc4e80ca0f50e890341')

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
