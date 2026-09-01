# Maintainer: Micro <microgamercz@proton.me> -> https://github.com/MicrogamerCz

pkgname=piqi-git
pkgver=0.2.1.r37.gf9311e9
pkgrel=1
pkgdesc="Unofficial Qt API for Pixiv (with async support)"
arch=(x86_64)
url="https://github.com/MicrogamerCz/Piqi"
license=(GPL-3.0-or-later)
depends=(qcoro qt6-base qt6-declarative)
provides=('piqi')
makedepends=(extra-cmake-modules git)
source=("git+https://github.com/MicrogamerCz/Piqi")
sha256sums=('SKIP')

pkgver() {
  cd Piqi
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S Piqi \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
