# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-connections
_pkgname=connections
pkgver=3.38.0
pkgrel=1
pkgdesc="Remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/connections"
license=('GPL3')
depends=('gtk-frdp' 'gtk-vnc')
makedepends=('git' 'meson' 'vala')
_commit=b9592076bb132e2ad5bdf3116001fb697e4084d1  # tags/v3.38.0
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
