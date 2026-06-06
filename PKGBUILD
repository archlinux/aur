# Maintainer: Sam Vervaeck <samvv at pm dot me>
pkgname=evcape
pkgver=1.1.0
pkgrel=1
pkgdesc="A small tool for making the CapsLock/Control key act as an Escape-key on Linux/Wayland"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/samvv/evcape"
license=('MIT')
depends=('libevdev' 'systemd-libs')
makedepends=('meson')
source=(
  "evcape-${pkgver}.tar.gz::https://github.com/samvv/evcape/archive/refs/tags/v${pkgver}.tar.gz"
)

build() {
  cd "evcape-${pkgver}" || return 1
  meson setup build
  ninja -C build
}

package() {
  install -Dm644  "evcape-${pkgver}/LICENSE.txt"    -t "$pkgdir/usr/share/licenses/evcape/"
  install -Dm644  "evcape-${pkgver}/evcape.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm0755 "evcape-${pkgver}/build/evcape"   -t "$pkgdir/usr/bin/"
}
sha256sums=('fcf913617ea7da76df5d83d631cc28b2805a4da5673bd87833b08cb80b8cae24')
