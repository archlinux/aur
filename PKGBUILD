# $Id: PKGBUILD 249316 2015-10-14 04:36:15Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=polari
pkgname=$_pkgname-git
pkgver=3.27.2+28+g11a9192
pkgrel=1
pkgdesc="An IRC Client for GNOME"
arch=(i686 x86_64)
license=(GPL)
url="https://wiki.gnome.org/Apps/Polari"
depends=(gjs gtk3 telepathy-glib telepathy-idle telepathy-mission-control telepathy-logger)
makedepends=(intltool gobject-introspection desktop-file-utils appdata-tools gnome-common)
replaces=($_pkgname)
provides=($_pkgname-$pkgver)
conflicts=($_pkgname)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  [ -d _build ] && rm -rf _build
  meson build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd $_pkgname
  DESTDIR=${pkgdir} ninja -C build install
}
