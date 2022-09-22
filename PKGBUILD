# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=deviced-git
pkgver=r284.8bb6119
pkgrel=1
pkgdesc="Daemon that can be run on a development device that will allow IDEs and other tooling to interact with the device"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/chergert/deviced"
license=('GPL3')
depends=('libnm' 'jsonrpc-glib' 'flatpak' 'appstream-glib')
makedepends=('git' 'meson' 'ninja' 'gobject-introspection')
provides=('deviced' 'libdeviced')
conflicts=('deviced')
source=("$pkgname::git+https://gitlab.gnome.org/chergert/deviced.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
