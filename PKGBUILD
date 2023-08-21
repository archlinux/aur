# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=dethrace
pkgver=0.6.0
pkgrel=1
pkgdesc="Reverse engineering the 1997 game \"Carmageddon\""
arch=('i686' 'x86_64')
url="https://github.com/dethrace-labs/dethrace"
license=("GPL3")
depends=("libgl" "sdl2")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dethrace-labs/dethrace/archive/refs/tags/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=("5fa979272170806578aceb9bf528bff00e83593b96a7e4f432f6bdc31e125af0")

build() {
    echo "$pkgver" > "$pkgname-$pkgver/VERSION"
    cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DDETHRACE_INSTALL=ON \
      -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
