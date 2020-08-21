# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-connections
pkgver=3.37.90
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/felipeborges/connections"
license=('GPL3')
depends=('gtk-frdp' 'gtk-vnc')
makedepends=('git' 'meson' 'vala')
_commit=eb4b5769eb37556cb80db7795c4035a96e531cf2  # tags/v3.37.90
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
