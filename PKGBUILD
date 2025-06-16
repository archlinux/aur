# Maintainer: jzapiola <jzapiola@proton.me>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: LuoYi <langisme_dot_qq_com>
# Contributor: igor-dyatlov <dyatlov.igor@gmail.com>

pkgname=blackbox-terminal-git
pkgver=0.14.0.r70.g2895855
pkgrel=1
pkgdesc="A beautiful GTK 4 terminal."
arch=(x86_64)
url="https://gitlab.gnome.org/raggesilver/blackbox"
license=(GPL-3.0-or-later)
depends=(glib2 libadwaita vte4 json-glib libgee glibc dconf graphene libxml2 pango cairo librsvg gtk4)
makedepends=(git meson vala gi-docgen)
checkdepends=(appstream-glib)
provides=(blackbox-terminal)
conflicts=(blackbox-terminal)
source=(blackbox-terminal::git+https://gitlab.gnome.org/raggesilver/blackbox.git)
b2sums=('SKIP')

pkgver() {
  cd blackbox-terminal
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson blackbox-terminal build -D blackbox_is_flatpak=false
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
