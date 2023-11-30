# Maintainer: Mole Shang <135e2@135e2.dev>
pkgname=implay
pkgver=1.5.1
pkgrel=1
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
_tag=0f58225b297e38ebaf516b3b16232698d8c3bcf0 # git rev-parse "${pkgver}"
source=("implay::git+https://github.com/tsl0922/ImPlay.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags --match='[0-9]*.[0-9]*.[0-9]*' --exclude='*[^0-9.]*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
