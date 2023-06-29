pkgname=haruhishot
pkgver=0.3.9
pkgrel=1.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots' 'qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots' 'scdoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b41d3692a2d3d23e59d15967d75a7058cb2e08ce7a070ec49ecfc25da7e07c9')

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    -Denable-notify=true \
    -Denable-gui=true \
    -Denable-swayipc=true \
    -Ddesktop-entry=true \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
