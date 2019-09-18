# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-ticfocuser-git
pkgver=r74.9929333
pkgrel=1
pkgdesc="3rd party drivers for INDI: TicFocuser-ng bleeding edge."
url="https://github.com/sebo-b/TicFocuser-ng"
license=(GPL3)
arch=(i686 x86_64)
depends=()
makedepends=(cmake)
provides=("libindi-ticfocuser")
conflicts=("libindi-ticfocuser")
source=("git+https://github.com/sebo-b/TicFocuser-ng.git")
sha256sums=("SKIP")

pkgver() {
  cd TicFocuser-ng
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../TicFocuser-ng

  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
