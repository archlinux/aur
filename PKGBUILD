pkgname=gdgbatterysaver
pkgver=0.2.1
pkgrel=1.0
pkgdesc='Green Dam Girl control battery'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/gdgbatterysaver'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'qt5-base')
source=("gdgbatterysaver-v${pkgver}.tar.gz::https://github.com/Decodetalkers/gdgbatterysaver/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a5ec8c4b9e7c96ddcbace59faadd9aa14371d990cde42931178b9330e41f4896')
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
