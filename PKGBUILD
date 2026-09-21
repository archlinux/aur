pkgname="sleex-welcome-screen-git"
_pkgname="sleex-welcome-screen"
pkgver=1.0.r7.165d4f3
pkgrel=1
pkgdesc="Welcome screen and interactive tutorial for Sleex desktop environment"
url="https://github.com/axos-project/sleex-welcome-screen"
arch=("x86_64")
depends=(
  "qt6-base" "qt6-declarative" "qt6-wayland" "layer-shell-qt" "sleex-ui-kit"
)
makedepends=("cmake")
optdepends=(
  "sleex: Sleex desktop environment"
  "hyprland: Wayland compositor"
)
provides=("sleex-welcome-screen")
conflicts=("sleex-welcome-screen")
source=("git+https://github.com/axos-project/sleex-welcome-screen.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/src"
  rm -rf build/
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j$(nproc --ignore=2)
}

package() {
  cd "$srcdir/$_pkgname/src"
  DESTDIR="$pkgdir" cmake --install build
}
