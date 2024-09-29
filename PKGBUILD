# Maintainer:
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

_pkgname="gala"
pkgname="$_pkgname-git"
pkgver=8.0.1.r13.ga31eab4
pkgrel=1
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
  gtk4
  libcanberra
  libgee
  libgl
  libgranite-7.so # granite7
  libgranite.so   # granite
  libhandy-1.so   # libhandy
  libxfixes
  mutter46
)
makedepends=(
  git
  meson
  vala
)

provides=(
  "$_pkgname=${pkgver%%.r*}"
  libgala.so
)
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
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
