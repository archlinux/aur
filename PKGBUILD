# Maintainer: Anthony Rabbito <hello@anthonyrabbito.com>

pkgname=flatpak-xdg-utils
pkgver=1.0.4
pkgrel=3
pkgdesc="Utilities for containerized apps to launch programs outside the container"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/flatpak/flatpak-xdg-utils"
license=('GPL')
depends=()
optdepends=('flatpak: interface support' 'flatpak-builder: interface support for building flatpaks')
makedepends=('ninja' 'meson')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/flatpak/flatpak-xdg-utils/releases/download/${pkgver}/flatpak-xdg-utils-${pkgver}.tar.xz")
sha256sums=('3ae9278ec0ef301b80032fcb95415ea95d5f439fbde1373e06ba41668dbae9e1')

build() {
  meson --prefix /usr \
    --buildtype=plain \
    --bindir=/usr/libexec/flatpak-xdg-utils \
    -Dinstalled_tests=true \
    "$srcdir/flatpak-xdg-utils-${pkgver}" build

  ninja -Cbuild
}

package() {
  DESTDIR="$pkgdir" ninja -Cbuild install
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/libexec/flatpak-xdg-utils/flatpak-spawn $pkgdir/usr/bin/
}
