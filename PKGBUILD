# $Id: PKGBUILD 249316 2015-10-14 04:36:15Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=polari
pkgname=$_pkgname-git
pkgver=49.0+4+g0da6032d
pkgrel=1
pkgdesc="An IRC Client for GNOME"
arch=(i686 x86_64)
license=(GPL)
url="https://wiki.gnome.org/Apps/Polari"
depends=(
  dconf
  gcc-libs
  gjs
  glib2
  glibc
  gnome-keyring
  gtk4
  hicolor-icon-theme
  libadwaita
  libgirepository
  libsoup3
  telepathy-glib
  telepathy-idle
  telepathy-logger
  telepathy-mission-control
  tracker3
)
makedepends=(
  appstream
  git
  gobject-introspection
  meson
  yelp-tools
)
optdepends=('webkit2gtk-4.1: URL preview feature')
replaces=($_pkgname)
provides=($_pkgname-$pkgver)
conflicts=($_pkgname)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/-/+/g'
}

build() {
  arch-meson polari build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
