# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.1
pkgrel=6
_imguiver=1.81
pkgdesc="Library which allows you to use ImGui with SFML"
arch=("any")
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
	"https://github.com/ocornut/imgui/archive/v${_imguiver}.tar.gz"
	"package.patch"
	"imgui_tables.patch")
md5sums=('6e7fc0bd05372e668c786f7e25591302'
         '9b48ac38829b538233f99c0aa8cacf50'
         '7e2a85494a0987e44e44ddaf79adb152'
         '3a48bd7bacc9e322f03aa69a83c46932')
depends=("sfml")
makedepends=("cmake")


prepare() {
	cd ${srcdir}
	patch --strip=1 --input=package.patch
	patch --strip=1 --input=imgui_tables.patch
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake -DCMAKE_CXX_FLAGS="-ffile-prefix-map=${srcdir}=." -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DBUILD_SHARED_LIBS=ON -DIMGUI_DIR=${srcdir}/imgui-${_imguiver} .
	cmake --build .
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake --build . --target install
}
