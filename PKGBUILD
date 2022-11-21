pkgname=gdgbatterysaver
pkgver=0.2.0
pkgrel=1.0
pkgdesc='Green Dam Girl control battery'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/gdgbatterysaver'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("gdgbatterysaver-v${pkgver}.tar.gz::https://github.com/Decodetalkers/gdgbatterysaver/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('575917d6469baf3e9fbf94aa65a54629a0397a01dd6050fbfaac0a78c7b600cf')
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
