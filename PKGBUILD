# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.1
pkgrel=4
_imguiver=1.79
pkgdesc="Library which allows you to use ImGui with SFML"
arch=("any")
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
	"https://github.com/ocornut/imgui/archive/v${_imguiver}.tar.gz"
	"package.patch")
md5sums=('6e7fc0bd05372e668c786f7e25591302'
         '88db45beef022784690eef0665c6021d'
         '7e2a85494a0987e44e44ddaf79adb152')
depends=("sfml")
makedepends=("cmake")


prepare() {
	cd ${srcdir}
	patch --strip=1 --input=package.patch
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
