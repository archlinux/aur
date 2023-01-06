pkgname=haruhishot
pkgver=0.2.6
pkgrel=1.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a295feae7bbcf20fdaf0658f8aa7bbb999359745fe2b6a2b99771dd0f7eec45')

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
