# Maintainer: Mole Shang <135e2@135e2.dev>
pkgname=implay
pkgver=1.3.3
pkgrel=1
pkgdesc="Desktop media player built on top of mpv and imgui"
arch=('x86_64')
url="https://github.com/tsl0922/ImPlay"
license=('GPL3')
depends=('mpv')
makedepends=(
  'cmake'
  'gtk3'
  'freetype2'
)
optdepends=()
source=('implay::git+https://github.com/tsl0922/ImPlay.git?tag=${pkgver}')
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DUSE_PATCHED_GLFW=ON
  cmake --build build
}

package() {
  cd "${pkgname}"
  DESTDIR="$pkgdir" cmake --install build
}
