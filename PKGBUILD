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
sha256sums=('31ff87b145594ecfe537b2de1f2e82afe3452cea0e0bf50c0e5581abfa75fdd9')

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
