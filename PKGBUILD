pkgname=lala-musicbar
pkgver=0.2.0
pkgrel=1.0
pkgdesc='A music bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-musicbar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-musicbar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73e4c152990d0510c78c9cf82d79ad41d059a26c12b16b7dec1ba100b318f1a2')
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
