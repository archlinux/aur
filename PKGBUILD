# Maintainer: Torikul Habib <torik.habib@gmail.com>
pkgname=gabutytb
pkgver=1.0.0
pkgrel=1
pkgdesc="Frontend of YT-DLP built with GTK4 for Gabut Download Manager"
arch=('x86_64')
url="https://github.com/gabutakut/gabutytb"
license=('LGPL2.1')
depends=(
  'python3'
  'libgtk-4-dev'
)
makedepends=(
  'meson'
  'ninja'
  'vala'
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutytb/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('894a4e46802b9a00023255970b3b7cdd160fc0f2985d7531c12b5e154da03a2e')

build() {
  cd "$pkgname-$pkgver"
  meson setup build \
    --prefix=/usr \
    --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
}
