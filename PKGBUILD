pkgname=neocmakelsp
pkgver=0.11.0
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
   '28fedfcd4248adda29558fb45ad6c368ef5232edd1ce3285d9838abe3701aec8'
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
