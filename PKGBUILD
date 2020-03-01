# Maintainer: 100best
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=libdazzle
pkgname=libdazzle-unstable
pkgver=3.35.3
pkgrel=0
pkgdesc="A library to delight your users with fancy features"
url="https://gitlab.gnome.org/GNOME/libdazzle"
arch=(x86_64)
license=(LGPL)
depends=(gtk3)
makedepends=(git meson vala gobject-introspection gtk-doc)
checkdepends=(xorg-server-xvfb)
_commit=78559e0ccc3fee4cf1465639db446088fe9a25b0 # tags/3.35.3^0
source=("git+https://gitlab.gnome.org/GNOME/libdazzle.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(libdazzle libdazzle-git)
provides=(libdazzle)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build -D enable_gtk_doc=true
  ninja -C build
}

check() {
  xvfb-run dbus-run-session meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
