pkgname=lala-musicbar
pkgver=0.2.7
pkgrel=1.0
pkgdesc='A music bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-musicbar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-musicbar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('edec2a97bb28755e8cb1809743579d558892690e1b9bcfc8d6de9a804622866b')
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
