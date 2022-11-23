# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine
_pkgname=wallpaper-engine-kde-plugin
pkgver=0.5.4
_pkgver_glslang=11.11.0
pkgrel=3
pkgdesc='A KDE wallpaper plugin integrating wallpaper engine'
arch=('x86_64')
url="https://github.com/catsout/${_pkgname}"
license=('GPL2')
depends=('gst-libav' 'python-websockets' 'plasma-framework' 'qt5-declarative' 'qt5-websockets')
makedepends=('extra-cmake-modules' 'qt5-webchannel' 'mpv' 'vulkan-headers')
optdepends=('qt5-webchannel: for web support'
	'mpv: alternative video backend')
source=("https://github.com/catsout/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"https://github.com/KhronosGroup/glslang/archive/${_pkgver_glslang}/glslang-${_pkgver_glslang}.tar.gz")
sha256sums=('83354734f7ea36e7077206506dd05f0e6877eb51294b820fdbdc398255c6f803'
            '26c216c3062512c018cbdd752224b8dad703b7e5bb90bf338ba2dbb5d4f11438')

prepare() {
	mv -T "glslang-${_pkgver_glslang}" "${_pkgname}-${pkgver}/src/backend_scene/third_party/glslang"
}

build() {
	cmake -B build -S "${_pkgname}-${pkgver}" \
	  -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
