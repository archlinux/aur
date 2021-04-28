# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.3
pkgrel=1
_imguiver=1.82
pkgdesc="Library which allows you to use ImGui with SFML"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
		"imgui-${_imguiver}.tar.gz::https://github.com/ocornut/imgui/archive/v${_imguiver}.tar.gz")
sha512sums=('2c7c848cf99a2a2ecc834e20aa65252c1986aabe397c9241f7ae8eb5e78ffa49ad70cc140fba37001386df9e515bf847abcc16631c7bdea944926b1128d55b9f'
			'210076c2b04c09e63a4924e1f874bfe240668f4d2656511c96dd5499efe04d795ad01d5af8e2aa2543849d3ca5ef1a6c6555a9232d4d92f95bf98c41e8505b58')
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
