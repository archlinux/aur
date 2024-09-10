pkgname=lala-bar
pkgver=0.3.12
pkgrel=1.0
pkgdesc='A bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-bar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-bar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb5a085a11ab535145b060f3fb051bd3d5ad003dbb1cd7336aa2ca18e1c40ac6')
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
