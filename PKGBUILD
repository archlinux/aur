# Maintainer: Mole Shang <135e2@135e2.dev>
pkgname=implay
pkgver=1.4.0
pkgrel=2
pkgdesc="Desktop media player built on top of mpv and imgui"
arch=('x86_64')
url="https://github.com/tsl0922/ImPlay"
license=('GPL3')
depends=(
  'mpv'
  'glfw'
  'xdg-desktop-portal'
)
makedepends=(
  'cmake'
  'gtk3'
  'freetype2'
)
optdepends=()
source=(
  'implay::git+https://github.com/tsl0922/ImPlay.git?tag=${pkgver}'
  '0001-disable-unneeded-imgui-demo-window.patch'
)
sha256sums=(
  'SKIP'
  '3fc9762c0b634ed72df8197bd4d618a4bc3a8f85b94d3155cb42f870e1d00616'
)

prepare() {
  patch -d "${pkgname}" -Np1 -i "${srcdir}/0001-disable-unneeded-imgui-demo-window.patch"
}

build() {
  cd "${pkgname}"
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DUSE_XDG_PORTAL=ON
  cmake --build build
}

package() {
  cd "${pkgname}"
  DESTDIR="$pkgdir" cmake --install build
}
