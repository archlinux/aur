pkgname=gnome-terminal-git
_pkgname=gnome-terminal
pkgver=3.41.90+29+g9100fd9a
pkgrel=1
pkgdesc="The GNOME Terminal Emulator"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3-git' 'gsettings-desktop-schemas')
makedepends=('docbook-xsl' 'git' 'gnome-shell' 'libnautilus-extension' 'meson' 'yelp-tools')
source=("git+https://gitlab.gnome.org/GNOME/gnome-terminal.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir "$pkgdir"
}
