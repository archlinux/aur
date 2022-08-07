# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine
_pkgname=wallpaper-engine-kde-plugin
pkgver=0.5.4
_pkgver_glslang=11.10.0
pkgrel=2
pkgdesc='A KDE wallpaper plugin integrating wallpaper engine'
arch=('x86_64')
url='https://github.com/catsout/wallpaper-engine-kde-plugin'
license=('GPL2')
depends=('gst-libav' 'python-websockets' 'plasma-framework' 'qt5-declarative' 'qt5-websockets')
makedepends=('extra-cmake-modules' 'qt5-webchannel' 'mpv' 'vulkan-headers')
optdepends=('qt5-webchannel: for web support'
	'mpv: alternative video backend')
source=("https://github.com/catsout/${_pkgname}/archive/v${pkgver}.tar.gz"
	"https://github.com/KhronosGroup/glslang/archive/${_pkgver_glslang}.tar.gz")
sha256sums=('83354734f7ea36e7077206506dd05f0e6877eb51294b820fdbdc398255c6f803'
	'8ffc19c435232d09299dd2c91e247292b3508c1b826a3497c60682e4bbf2d602')

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
