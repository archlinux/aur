pkgname=haruhishot
pkgver=0.3.10
pkgrel=2.0
pkgdesc='One day Haruhi Suzumiya made a wlr screenshot tool'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/haruhishot'
license=('MIT')
depends=('wayland' 'wlroots' 'qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'wayland-protocols' 'wlroots' 'scdoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/haruhishot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4210b8e8fe450986d59c102893962c1105dc7f21978fd1faeee1e83d291657c2')

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
