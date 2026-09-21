# Maintainer: Ardox <ardox@axos-project.com>
pkgname=sleex-ui-kit-git
_pkgname=sleex-ui-kit
pkgver=1.0.r22.a17b0da
pkgrel=9
pkgdesc="UI kit for Sleex desktop environment (git version)"
arch=("x86_64")
url="https://github.com/axos-project/sleex-ui-kit"
license=('GPL3')
depends=(
  "qt6-base" "qt6-declarative" "qt6-tools" "qt6-wayland"
)
optdepends=("sleex-git: The Sleex desktop environment")
provides=("sleex-ui-kit")
conflicts=("sleex-ui-kit")
source=("git+https://github.com/axos-project/sleex-ui-kit.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/src"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc --ignore=2)
}

package() {
  cd "$srcdir/$_pkgname/src/build"
  DESTDIR="$pkgdir" cmake --install .
}
