# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.3
pkgrel=2
_imguiver=1.85
pkgdesc="Library which allows you to use ImGui with SFML"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
		"imgui-${_imguiver}.tar.gz::https://github.com/ocornut/imgui/archive/v${_imguiver}.tar.gz")
sha512sums=('2c7c848cf99a2a2ecc834e20aa65252c1986aabe397c9241f7ae8eb5e78ffa49ad70cc140fba37001386df9e515bf847abcc16631c7bdea944926b1128d55b9f'
			'830ff36681a661d77754fb7818bb13cc63da58a293d343a8d6847a586f00c6e0bfc3ffe51cdf882849e5083d4ddca52cdbdc1b3abc9b794a96f89ae7628f1fc2')
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
