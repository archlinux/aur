# Maintainer: Radiolin <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette-git
pkgver=0.2.1.g49.r307.ga1a166f
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  dconf
  glibc
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  libapi-base-git
  libcase-git
  libtape-git
  webkitgtk-6.0
  xdg-desktop-portal-impl
)
makedepends=(
  blueprint-compiler
  git
  gobject-introspection
  meson
  vala
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson -Dnightly=true ${pkgname%-git} build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
