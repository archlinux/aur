# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=theforceengine-git
_pkgname=TheForceEngine
pkgver=1.09.540.r328.g9ecb4a6
pkgrel=1
epoch=1
pkgdesc="Modern \"Jedi Engine\" replacement supporting Dark Forces, Outlaws and the mods"
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL2')
depends=("libgl" "sdl2" "devil" "glew" "rtaudio" "rtmidi" "hicolor-icon-theme" "sdl2_image" )
makedepends=("cmake" "ninja" "git")
conflicts=("theforceengine")
optdepends=()
install="theforceengine.install"
source=("TheForceEngine::git+https://github.com/luciusDXL/TheForceEngine.git"
        "theforceengine.install")
sha256sums=('SKIP'
            'SKIP')
options=(!debug)
            
pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}         

build() {
  cd $_pkgname
  mkdir build
  cd build
  cmake -S .. \
    -G Ninja\
    -DCMAKE_INSTALL_PREFIX=/usr\
    -DCMAKE_BUILD_TYPE=Release
  ninja
}

package() {
  cd $_pkgname/build
  DESTDIR="$pkgdir" ninja install
}

