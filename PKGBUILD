# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine
_pkgname=wallpaper-engine-kde-plugin
pkgver=0.5.0
_pkgver_glslang=11.9.0
pkgrel=1
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('any')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL2')
depends=('gst-libav' 'python-websockets' 'plasma-framework' 'qt5-declarative' 'qt5-websockets' 'qt5-webchannel')
makedepends=('extra-cmake-modules' 'mpv' 'vulkan-headers')
optdepends=('mpv: video playback')
source=("https://github.com/catsout/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/KhronosGroup/glslang/archive/refs/tags/${_pkgver_glslang}.tar.gz")
sha256sums=('13e320a2e2758827daf7fc1132935cc1082235f8f38f7138b78996cbc85730d0'
	'd5744adba19eef9ad3d73f524226b39fec559d94cb582cd442e3c5de930004b2')

prepare() {
	mv -T "glslang-${_pkgver_glslang}" "${_pkgname}-${pkgver}/src/backend_scene/third_party/glslang"
}

build() {
	cd "${_pkgname}-${pkgver}"
	mkdir -p build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) ..
	make
}

package() {
	cd "${_pkgname}-${pkgver}"
	cd build
	make DESTDIR="$pkgdir/" install
}
