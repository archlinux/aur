pkgname=lala-bar
pkgver=0.2.8
pkgrel=1.0
pkgdesc='A bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-bar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-bar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6eff7d812a597159ae08e2a21f67be2f1526b5051fec39dd67712f565bbfe96a')
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
