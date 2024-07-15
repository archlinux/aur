# Maintainer:
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

_pkgname="gala"
pkgname="$_pkgname-git"
pkgver=7.1.3.r182.g5c7fd36
pkgrel=0.1
pkgdesc='The Pantheon Window Manager'
url='https://github.com/elementary/gala'
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  cairo
  gdk-pixbuf2
  glib2
  gnome-desktop
  graphene
  gtk3
  libcanberra
  libgee
  libgl
  libgranite.so # granite
  libhandy-1.so # libhandy
  libxfixes
  mutter
)
makedepends=(
  git
  granite7
  meson
  vala
)

provides=(
  "gala=${pkgver%%.r*}"
  libgala.so
)
conflicts=(gala)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/elementary/gala.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
