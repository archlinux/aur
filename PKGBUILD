
# Maintainer: Leah Anderson <leah@chromebooks.lol>
pkgname=uzdoom
pkgver=4.14.3
pkgrel=1
pkgdesc="UZDoom is a feature centric port for all Doom engine games, based on GZDoom, adding an advanced renderer and powerful scripting capabilities"
arch=(x86_64)
url="https://zdoom.org"
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'openal' 'sdl2' 'zmusic')
makedepends=('python' 'cmake' 'desktop-file-utils' 'ninja' 'git')
optdepends=()
provides=('uzdoom')
conflicts=('uzdoom-git' 'uzdoom-bin' 'uzdoom-appimage')
source=("https://github.com/UZDoom/UZDoom/archive/refs/tags/4.14.3.tar.gz")
sha256sums=('6ee381395e249fd02a8484e0e98330afd1cdf222b26cafece7b3d3f5188d7014')
setup() {
	cd "UZDoom-$pkgver"
	./auto-setup-linux.sh
}

build() {
	cd "UZDoom-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja ..
	cmake --build . --config Release
}

package() {
	cd "UZDoom-$pkgver"
	cd build
	cmake --install .
}
