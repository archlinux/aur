# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.12.2+24+gd5e5bc5
pkgrel=1
pkgdesc="Library for OpenPGP prompts"
url="https://gitlab.gnome.org/GNOME/libcryptui"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gpgme dbus-glib libnotify gcr dconf libsm)
makedepends=(intltool gobject-introspection gnome-common git)
_commit=f29d1d37cb4553ecd82a67e63aa0f0888de9acc8  # master
source=("git+https://gitlab.gnome.org/GNOME/libcryptui.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile --enable-gtk-doc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
