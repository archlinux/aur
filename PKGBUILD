# Maintainer: Baal <weiss.sebastian@gmx.net

pkgname=theforceengine
pkgver=1.09.100
pkgrel=1
pkgdesc="Modern \"Jedi Engine\" replacement supporting Dark Forces, Outlaws and the mods"
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL2')
depends=("libgl" "sdl2" "devil" "glew" "rtaudio" "rtmidi" "hicolor-icon-theme")
makedepends=("cmake" "ninja" "git")
optdepends=()
_tag=00c87198486cb9ccf10fa4f4ac1980435f0837a6
source=("TheForceEngine::git+https://github.com/luciusDXL/TheForceEngine.git#tag=$_tag"
        "theforceengine.install")
sha256sums=('SKIP'
            '3970ca1539bfdfd0f87c5bdcca7ba6847037f1d72614b2a8067d35dd1ad0b5bb')

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

