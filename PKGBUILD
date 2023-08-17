# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
pkgname=principia-git
pkgver=r161.3945352
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk3' 'glew' 'curl' 'libpng' 'libjpeg' 'freetype2' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=()
source=('git+https://github.com/Bithack/principia')
sha256sums=(SKIP)
options=()

pkgver() {
	cd principia
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd principia/
	
	mkdir -p build
	cd build
	cmake .. -G Ninja
	ninja
}

package() {
	cd principia/
	install -Dm755 "build/principia" "${pkgdir}/usr/bin/principia"
	
	install -Dm644 "build-linux/principia.desktop" "${pkgdir}/usr/share/applications/principia.desktop"
	install -Dm644 "build-linux/principia-url-handler.desktop" "${pkgdir}/usr/share/applications/principia-url-handler.desktop"
	
	install -Dm644 "build-linux/principia.png" "${pkgdir}/usr/share/pixmaps/principia.png"

	install -d "${pkgdir}/usr/share/principia/"
	cp -r data-{shared,pc} "${pkgdir}/usr/share/principia/"
}
