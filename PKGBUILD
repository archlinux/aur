pkgname=neocmakelsp
pkgver=0.8.0
pkgrel=1.0
pkgdesc='CMake LSP implementation based on Tower and Tree-sitter'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/neocmakelsp'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/neocmakelsp/archive/refs/tags/v${pkgver}.tar.gz")
options+=(!lto)
sha256sums=('7fbe5501d36885e7a93b8d2122eb8506e6fa7d75d43718f0ee0fab09bc7ee5e8')

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr/ \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
