# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.5
pkgrel=1
_imguiver=1.86
pkgdesc="Library which allows you to use ImGui with SFML"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
		"imgui-${_imguiver}.tar.gz::https://github.com/ocornut/imgui/archive/v${_imguiver}.tar.gz")
sha512sums=('d7b8a17492f34d252167763e4b5f1f70de9ffa27a9f33ec0d8da4ba27e20d6f47ac1895da36c90303d7801cfb1702c642be35016d4d53efed3091466d40631ff'
			'e84fdc0839e96e53dcbe3a5d13bbd0def860c09bafa709b22f8371d5c710f5c90f6957e5f12813156ed0c4d0fa2b56c5e3be701206f7770749ce169818697229')
depends=("sfml")
makedepends=("cmake")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake -DCMAKE_CXX_FLAGS="-ffile-prefix-map=${srcdir}=." -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DBUILD_SHARED_LIBS=ON -DIMGUI_DIR=${srcdir}/imgui-${_imguiver} .
	cmake --build .
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake --build . --target install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-LICENSE"
	install -Dm644 "${srcdir}/imgui-${_imguiver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/imgui-LICENSE.txt"
}
