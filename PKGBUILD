# Maintainer: Jason Edson <jaysonedson@gmail.com>

pkgname=meld-git
pkgver=3.22.0.436.g3fb05255
pkgrel=1
pkgdesc='Visual diff and merge tool'
url='http://meldmerge.org/'
license=(GPL-2.0-or-later)
arch=(any)
depends=(
  dconf
  gdk-pixbuf2
  glib2
  gsettings-desktop-schemas
  gtk3
  gtksourceview4
  hicolor-icon-theme
  pango
  python
  python-cairo
  python-gobject
)
makedepends=(
  git
  meson
  yelp-tools
)
checkdepends=(appstream-glib)
provides=(meld)
conflicts=(
  meld
  meld-dev
)
source=("git+https://gitlab.gnome.org/GNOME/${pkgname%-git}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --always | sed 's|-|.|g'
}

build() {
  arch-meson build ${pkgname%-git}
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
