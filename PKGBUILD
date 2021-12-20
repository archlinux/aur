pkgname=aether-reverb-lv2
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
license=('MIT')
pkgdesc="Aether Algorithmic Reverb (LV2)"
url="https://github.com/Dougal-s/Aether"
groups=('pro-audio' 'vst-plugins')
depends=('freetype2' 'alsa-lib' 'libxext' 'libglvnd')
makedepends=('git' 'libxinerama' 'libxrender' 'libxcursor' 'lv2' 'libgl' 'meson')
source=("${pkgname}"::"git+https://github.com/Dougal-s/Aether.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	git clone --recurse-submodules -j$(nproc) https://github.com/Dougal-s/Aether.git
	cd Aether
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE="Release"
	make -j$(nproc)
}

package() {
	mkdir -p ${pkgdir}/usr/lib/lv2
	cp -r ${srcdir}/${pkgname}/Aether/build/aether.lv2 ${pkgdir}/usr/lib/lv2/aether.lv2
}
