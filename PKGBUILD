# Maintainer: Mole Shang <135e2@135e2.dev>
pkgname=implay
pkgver=1.4.0
pkgrel=6
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
  'implay::git+https://github.com/tsl0922/ImPlay.git?commit=28a5fa84442cf5f21854526ef56ab86ba7156bda'
  '0001-disable-unneeded-imgui-demo-window.patch'
)
sha256sums=(
  'SKIP'
  'ee4836cdde04b7e9a1fe6e27b2d9fc0751aea66066836b61dc0968cae402ca60'
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
