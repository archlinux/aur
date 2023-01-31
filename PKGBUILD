pkgname=haruhishot
pkgver=0.3.2
pkgrel=2.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots' 'qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots' 'scdoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ade85d1111106ba8325beb29c5d6eaa40aefad4eb391415d5688575e5ef72e79')

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
