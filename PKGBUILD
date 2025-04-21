# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>

pkgname=boatswain
pkgver=5.0
pkgrel=1
pkgdesc='Control Elgato Stream Deck devices'
arch=(x86_64)
url='https://gitlab.gnome.org/World/boatswain'
license=(GPL-3.0-or-later)
depends=(
  hidapi
  libadwaita
  libgusb
  libpeas-2
  libportal-gtk4
  libsecret
)
makedepends=(
  git
  meson
  glib2-devel
  gobject-introspection
)
_commit=d05c7332 # tags/5.0
source=("git+${url}.git#commit=$_commit")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
