pkgname='openflow-git'
_pkgname='openflow'
pkgver=r13.4869d4f
pkgrel=1
pkgdesc="Flow-based switch specification."
arch=('x86_64')
url="https://gitlab.com/nsnam/openflow"
license=('GPL-2.0-only')
conflicts=('openflow')
provides=('openflow')
depends=('libxml2')
makedepends=('cmake' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S ${_pkgname}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

