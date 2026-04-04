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
  'libqrencode'
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
sha256sums=('77bc9c4f5919843c12c65b3b241c2788c1b02457d01afc9530b85b4e420ec54e')

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
