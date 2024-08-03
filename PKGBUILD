pkgname=lala-musicbar
pkgver=0.2.3
pkgrel=1.0
pkgdesc='A music bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-musicbar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-musicbar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('26be442e912831f13a4c06e976d7c58bc5928a15f9512f22f5fe321f71f23751')
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
