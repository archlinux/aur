pkgname=lala-musicbar
pkgver=0.2.1
pkgrel=1.0
pkgdesc='A music bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-musicbar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-musicbar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f52930a6039565af3199c18f4144ee3c4d3146ffe1176b7578663f9ffc8b793')
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
