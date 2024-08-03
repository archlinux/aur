pkgname=lala-musicbar
pkgver=0.2.6
pkgrel=1.0
pkgdesc='A music bar with layershell'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/lala-musicbar'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/lala-musicbar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e1d11db8be9bfbb4c202eb555208e1e6a7908bb524cebc98ec889cefff5de59')
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
