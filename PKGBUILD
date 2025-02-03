pkgname='brite-git'
_pkgname='BRITE'
pkgver=r20.aa2e655
pkgrel=1
pkgdesc="Boston University Representative Internet Topology Generator."
arch=('x86_64')
url="https://gitlab.com/nsnam/BRITE"
license=('GPL-2.0-only')
conflicts=('brite')
provides=('brite')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
source=("git+${url}.git")

sha256sums=('SKIP')

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

