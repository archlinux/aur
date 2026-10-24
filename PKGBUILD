pkgname=lala-bar
pkgver=0.5.0
pkgrel=1.0
pkgdesc='A bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-bar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-bar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31df78953370ab0d68a8cd5072b0ed9464701e20a8a040e7756ee433def22024')
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
