# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=wirecontrol-git
_pkgname=wirecontrol
pkgver=r13.b9262ae
pkgrel=1
provides=(wirecontrol)
pkgdesc="An audio control center for pipewire"
arch=(x86_64)
license=(GPL3)
url="https://github.com/kotontrion/wirecontrol"
depends=(
  gtk4
  libadwaita
  libastal-wireplumber
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
source=("git+https://github.com/kotontrion/wirecontrol.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "$pkgdir"
}

