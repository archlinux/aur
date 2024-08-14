pkgname=lala-bar
pkgver=0.3.5
pkgrel=1.0
pkgdesc='A bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-bar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-bar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae5440460e953c908f546c24ad5e3e11360ccc05a0039e1882d5831b5950987b')
options+=(!lto)

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  meson compile -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
