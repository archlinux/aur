pkgname=neocmakelsp
pkgver=0.10.0
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
   '084f4e8605e0834c3ca85abd7460801dc22454f45f68557340d02642a4be3c72'
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
