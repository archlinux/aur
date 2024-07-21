pkgname=neocmakelsp
pkgver=0.7.9
pkgrel=1.0
pkgdesc='CMake LSP implementation based on Tower and Tree-sitter'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/neocmakelsp'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/neocmakelsp/archive/refs/tags/v${pkgver}.tar.gz")
options+=(!lto)
sha256sums=('d1b6219e19f1ab630fbcb6d3179fcac5dc8dca1b7af355bb7516bc4345ce461b')

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
