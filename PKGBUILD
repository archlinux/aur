pkgname=gdgbatterysaver
pkgver=0.2.4
pkgrel=1.0
pkgdesc='Green Dam Girl control battery'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/gdgbatterysaver'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'qt5-base')
source=("gdgbatterysaver-v${pkgver}.tar.gz::https://github.com/Decodetalkers/gdgbatterysaver/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8819d322a9aa8ccd55c3434f22fd0f0e56db3f47d85dd442930680c2e78c4d3')
build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
