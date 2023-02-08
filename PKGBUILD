# Maintainer: Baal <weiss.sebastian@gmx.net

pkgname=theforceengine
pkgver=1.08.100
pkgrel=2
pkgdesc="Modern \"Jedi Engine\" replacement supporting Dark Forces, Outlaws and the mods"
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL2')
depends=("libgl" "sdl2" "devil" "glew" "rtaudio" "rtmidi" "hicolor-icon-theme")
makedepends=("cmake" "ninja" "git")
optdepends=()
_tag=5f40f6864aa2e3a6c4b3f48d240b6d5eb95a00f9
source=("TheForceEngine::git+https://github.com/luciusDXL/TheForceEngine.git#tag=$_tag")
sha256sums=(SKIP)

pkgver() {
  cd TheForceEngine
  git describe --tags | sed 's/^v//'
}

build() {
	cd TheForceEngine
	mkdir build
  cd build
  cmake -S .. \
    -G Ninja\
    -DCMAKE_INSTALL_PREFIX=/usr\
    -DCMAKE_BUILD_TYPE=Release
  ninja
}

package() {
	cd TheForceEngine/build
	DESTDIR="$pkgdir" ninja install
}

