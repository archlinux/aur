# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-connections
_pkgname=connections
pkgver=3.37.91
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/felipeborges/connections"
license=('GPL3')
depends=('gtk-frdp' 'gtk-vnc')
makedepends=('git' 'meson' 'vala')
_commit=a3cf35dbccb8b09ed80153d74bab8a8d95967d71  # tags/v3.37.91
source=("git+https://gitlab.gnome.org/GNOME/connections.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
