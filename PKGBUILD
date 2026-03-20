# shellcheck disable=all

pkgname=ura-git
_pkgname=ura
pkgver=r317.b4a66ca
pkgrel=1
pkgdesc="A highly customizable Wayland compositor driven by Lua"
url="https://github.com/levinion/ura"
arch=("any")
license=("GPLv3")
depends=("luajit" "wlroots0.19" "spdlog" "libnotify" "abseil-cpp")
makedepends=("cmake" "pkgconf" "make" "nlohmann-json" "sol2" "cli11" "cargo")
optdepends=("xwayland-satellite" "foot")
provides=("ura")
conflicts=("ura")
source=(
  "$_pkgname::git+https://github.com/levinion/$_pkgname.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make build
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"
}
