# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>

pkgname=boatswain
pkgver=0.2.2.r0.g3435a5b
pkgrel=1
pkgdesc='Control Elgato Stream Deck devices'
arch=(x86_64)
url='https://gitlab.gnome.org/World/boatswain'
license=(GPL3)
depends=(
  hidapi
  libadwaita
  libgusb
  libpeas
  libportal-gtk4
  libsecret
)
makedepends=(
  git
  meson
  gobject-introspection
)
_commit=3435a5b6feec3e8d6747b0c8066efff85c40eb75 # tags/0.2.2
source=("git+${url}.git#commit=$_commit")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
