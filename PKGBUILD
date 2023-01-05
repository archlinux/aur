pkgname=haruhishot
pkgver=0.2.4
pkgrel=2.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('59e20f58cf12f84e3c0a85bafec97e4e0dd36f4b28f797d92803acd2b3cc0072')

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
