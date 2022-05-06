# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine
_pkgname=wallpaper-engine-kde-plugin
pkgver=0.5.2
_pkgver_glslang=11.9.0
pkgrel=1
pkgdesc='A KDE wallpaper plugin integrating wallpaper engine'
arch=('x86_64')
url='https://github.com/catsout/wallpaper-engine-kde-plugin'
license=('GPL2')
depends=('gst-libav' 'python-websockets' 'plasma-framework' 'qt5-declarative' 'qt5-websockets')
makedepends=('extra-cmake-modules' 'qt5-webchannel' 'mpv' 'vulkan-headers')
optdepends=('qt5-webchannel: for web support'
	'mpv: alternative video backend')
source=("https://github.com/catsout/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/KhronosGroup/glslang/archive/refs/tags/${_pkgver_glslang}.tar.gz")
sha256sums=('dc4cc8d9282bb8f16662851acaf0a4622d24a096388810e8eb1ff31492c00a0b'
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
