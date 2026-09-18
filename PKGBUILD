# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>

pkgname=ueberzugpp-git
_pkgname=ueberzugpp
pkgver=r660.923f20b
pkgrel=1
pkgdesc="Command line utility which allows to display images in the terminal, written in C++"
arch=('x86_64')
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL-3.0-or-later")
provides=("ueberzug")
conflicts=("ueberzug" "ueberzugpp")
makedepends=("cmake" "cli11" "nlohmann-json" "wayland-protocols" "extra-cmake-modules" "range-v3")
depends=(
  "opencv"
  "libvips"
  "glib2"
  "libxcb"
  "xcb-util-image"
  "libsixel"
  "openssl"
  "spdlog"
  "libglvnd"
  "fmt"
  "chafa"
  "wayland"
  "onetbb"
  "glibc"
  "libgcc"
  "libstdc++"
  "xcb-util-errors"
)
source=("git+https://github.com/jstkdng/ueberzugpp.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  # -DENABLE_TURBOBASE64=ON \
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_WAYLAND=ON \
    -DENABLE_XCB_ERRORS=ON \
    -DENABLE_OPENGL=ON \
    -Wno-dev
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:

