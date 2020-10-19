# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-connections
_pkgname=connections
pkgver=3.38.1
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/connections"
license=('GPL3')
depends=('gtk-frdp' 'gtk-vnc')
makedepends=('git' 'meson' 'vala')
_commit=7373db222661a70b4dba268f5539034ccef62773  # tags/v3.38.1
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
