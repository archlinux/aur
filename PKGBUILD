# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine
_pkgname=wallpaper-engine-kde-plugin
pkgver=0.5.1
_pkgver_glslang=11.9.0
pkgrel=2
pkgdesc='A kde wallpaper plugin integrating wallpaper engine'
arch=('x86_64')
url='https://github.com/catsout/wallpaper-engine-kde-plugin'
license=('GPL2')
depends=('gst-libav' 'python-websockets' 'plasma-framework' 'qt5-declarative' 'qt5-websockets')
makedepends=('extra-cmake-modules' 'qt5-webchannel' 'mpv' 'vulkan-headers')
optdepends=('qt5-webchannel: for web support'
	'mpv: for scene support and alternative video backend')
source=("https://github.com/catsout/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/KhronosGroup/glslang/archive/refs/tags/${_pkgver_glslang}.tar.gz")
sha256sums=('b62b2f2ce48d45938af5d59f53aaaf0a199212d3805f383560360477c4d72132'
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
