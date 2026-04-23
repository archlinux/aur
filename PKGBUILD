pkgname=neocmakelsp
pkgver=0.10.2
pkgrel=3.0
pkgdesc='CMake LSP implementation based on Tower and Tree-sitter'
arch=('x86_64' 'aarch64')
url='https://github.com/neocmakelsp/neocmakelsp'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust' 'python')
depends=('cmake')
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/neocmakelsp/neocmakelsp/archive/refs/tags/v${pkgver}.tar.gz"
)
options+=(!lto)
sha256sums=(
   '55ae5a731fa3b7091dc8474420ba76f61a5228067ce71d69cc0d3fcc5d6f83dd'
)

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr/ \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
