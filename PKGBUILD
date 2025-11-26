pkgname=neocmakelsp
pkgver=0.9.0
pkgrel=1.0
pkgdesc='CMake LSP implementation based on Tower and Tree-sitter'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/neocmakelsp'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust' 'python')
depends=('cmake')
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/neocmakelsp/archive/refs/tags/v${pkgver}.tar.gz"
)
options+=(!lto)
sha256sums=(
   '323716e5aebf5487e3d2fe9dfd9451ee730a07ede22439193e6ec225343508fe'
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
