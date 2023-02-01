pkgname=haruhishot
pkgver=0.3.2.1
pkgrel=1.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots' 'qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots' 'scdoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91fbbaf4964b9b0272272eea55c5e8658f43c22bead98c9f1e70b227e21121ea')

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    -Denable-notify=true \
    -Denable-gui=true \
    -Ddesktop-entry=true \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
