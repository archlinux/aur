# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>

pkgname=boatswain
pkgver=0.3.0.r0.ge176cfd
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
_commit=e176cfd490790b3a0e1bd27a2602b3f4241b6a3b # tags/0.3.0
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
