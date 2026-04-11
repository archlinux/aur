# Maintainer: Torikul Habib <torik.habib@gmail.com>
pkgname=gabutdm-master
pkgver=2.8.7
pkgrel=2
pkgdesc="Simple, fast, and powerful Download Manager built with GTK4"
arch=('x86_64')
url="https://github.com/gabutakut/gabutdm"
license=('LGPL2.1')
depends=(
  'glib2'
  'gtk4'
  'sqlite'
  'libcanberra'
  'libsoup3'
  'libgee'
  'json-glib'
  'qrencode'
  'gdk-pixbuf2'
  'cairo'
  'libadwaita'
  'ffmpeg'
  'aria2'
)
makedepends=(
  'meson'
  'ninja'
  'vala'
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutdm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0bf7dc405c77c0c7a457acd9c8cb746981646224c1dd6fb54658ab9b04a84560')

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
