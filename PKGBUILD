# Maintainer: Andrej Halveland (SnipeX_ / SnipeX) <andrej.halv@gmail.com>

pkgname=qnearbyshare-git
pkgver=r51.701d54c
pkgrel=1
pkgdesc='Nearby Share implementation for Linux'
arch=(x86_64)
url='https://github.com/vicr123/QNearbyShare'
license=(MIT)
depends=(glibc gcc-libs crypto++ avahi qt6-base protobuf)
makedepends=(git cmake)
source=(${pkgname%-git}::git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd ${pkgname%-git}

  git submodule init
  git submodule update
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
