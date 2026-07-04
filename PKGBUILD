pkgname=neocmakelsp
pkgver=0.10.4
pkgrel=1.0
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
   'c36516b48b018ad25f3d97f79f346f5712b02365e800b87b8ddd3292245c8f46'
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
