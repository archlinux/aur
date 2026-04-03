# Maintainer: torikulhabib <torik.habib@gmail.com>
pkgname=gabutdm-master
pkgver=2.8.7
pkgrel=1
pkgdesc="Simple, fast, and powerful Download Manager built with GTK4"
arch=('x86_64')
url="https://github.com/gabutakut/gabutdm"
license=('LGPL2.1')
depends=(
  'gtk4'
  'libadwaita'
  'aria2'
  'libqrencode'
  'libcanberra'
  'glib2'
  'sqlite'
  'networkmanager'
)
makedepends=(
  'meson'
  'ninja'
  'vala'
  'pkg-config'
  'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutdm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8667bf33887648ea6bbe55900c74cd3da3c22a14e7750338553994d641a6b096')

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
