pkgname=haruhishot
pkgver=0.2.5
pkgrel=1.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8d47f23a08f0f69ee6a8dbbb9dc00ef5e1158df7a7dc11324cae2665dc412f8c')

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    -Denable-notify=true \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
