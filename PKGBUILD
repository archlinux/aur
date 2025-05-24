# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>

pkgname=alt-panelmoded-git
pkgver=0.6.1.r0.g801b61d
pkgrel=1
pkgdesc="Used for panelmode on operating systems of the Alt family with GNOME desktop enviroment"
arch=(x86_64)
url="https://gitlab.gnome.org/armatik/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  libgee
  libadwaita
  dconf
  glib2
)
makedepends=(
  meson
  vala
)
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
