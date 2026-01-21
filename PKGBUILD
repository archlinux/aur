# Maintainer: Sergey Zarechnev <da_kurlzzzzz@mail.ru>

pkgname=easy-switcher-git
pkgver=0.4.r32.gb1af840
pkgrel=1
pkgdesc="Keyboard layout switcher for Linux (git version)"
arch=(x86_64)
url="https://github.com/freemind001/preview"
license=(GPL-2.0-only)
depends=(glibc libevdev)
makedepends=(cmake git)
provides=(easy-switcher)
conflicts=(easy-switcher)
options=(!debug)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/preview"
  printf "0.4.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S $srcdir/preview
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

# vim: ft=sh
