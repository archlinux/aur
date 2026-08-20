# Maintainer: Nihit <nihitdev@users.noreply.github.com>
pkgname=zari
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast, keyboard-driven terminal file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/nihitdev/zari'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'ncurses' 'xdg-utils')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/nihitdev/zari.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -S "$pkgname" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
