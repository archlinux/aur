# Maintainer: Mole Shang <135e2@135e2.dev>
pkgname=implay
pkgver=1.4.0
pkgrel=7
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
  'git'
  'gtk3'
  'freetype2'
)
optdepends=()
source=(
  'implay::git+https://github.com/tsl0922/ImPlay.git#commit=9d6d1f58754032e3ea5a313ff8534b8439dc13f7'
  '0001-disable-unneeded-imgui-demo-window.patch'
)
sha256sums=(
  'SKIP'
  '7d8e03542e38cfbec2e3bf96e21e8d957c0b4c8edd92165a36d98b539742b49e'
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
