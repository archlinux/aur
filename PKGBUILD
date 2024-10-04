pkgname=haruhishot
pkgver=0.4.0
pkgrel=1.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'scdoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/v${pkgver}.tar.gz")
options+=(!lto)
sha256sums=('f71f4069f211e0546625402973fe144b2909e01c3d577ae56ac0ffb18f4f48da')

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
