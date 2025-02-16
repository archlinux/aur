pkgname=lala-bar
pkgver=0.4.3
pkgrel=1.0
pkgdesc='A bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-bar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-bar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8075d6caec917f1e4b59a86ccf2585fb14548a211be8502cf2574d9a069781e0')
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
