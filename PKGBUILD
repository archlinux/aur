# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-connections
pkgver=3.37.1
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/felipeborges/gnome-connections"
license=('GPL3')
depends=('gtk-frdp' 'gtk-vnc')
makedepends=('git' 'meson' 'vala')
_commit=4bb705da122db60219638d5495e5d1a8750338a7  # tags/v3.37.1^0
source=("git+https://gitlab.gnome.org/felipeborges/gnome-connections.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
