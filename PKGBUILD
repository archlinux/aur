# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=miracle-wm-git
pkgver=0.4.1.r72.gc64475e
pkgrel=1
pkgdesc="Wayland tiling window manager built on Mir"
arch=(x86_64)
url="https://github.com/miracle-wm-org/miracle-wm"
license=(GPL-3.0-only)
depends=(mir libnotify)
makedepends=(git cmake nlohmann-json glm boost)
provides=(miracle-wm)
conflicts=(miracle-wm)
source=("git+https://github.com/miracle-wm-org/miracle-wm.git")
sha256sums=('SKIP')

pkgver() {
  cd "miracle-wm"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "miracle-wm" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
