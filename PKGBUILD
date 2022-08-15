# Maintainer: Jason Edson <jaysonedson@gmail.com>

pkgname=meld-git
pkgver=3.21.1.16.g7d285ecc
pkgrel=1
pkgdesc='Visual diff and merge tool'
url='http://meldmerge.org/'
license=(GPL)
arch=(any)
depends=(
  dconf
  glib2
  gsettings-desktop-schemas
  gtk3
  gtksourceview4
  python-cairo
  python-gobject
)
makedepends=(
  git
  meson
  yelp-tools
)
optdepends=('python-dbus: open a new tab in an already running instance')
provides=(meld)
conflicts=(
  meld
  meld-dev
)
options=(!emptydirs)
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
