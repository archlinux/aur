# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-contacts-git
pkgver=3.31.3.r14.g93ca1c6
pkgrel=1
pkgdesc="Contacts Manager for GNOME"
url="https://wiki.gnome.org/Apps/Contacts"
arch=(x86_64)
license=(GPL2)
depends=(gtk3 folks gnome-desktop dconf gnome-online-accounts libgee cheese libhandy)
makedepends=(vala gobject-introspection git meson libhandy)
groups=(gnome)
conflicts=(gnome-contacts)
provides=(gnome-contacts)
source=("git+https://gitlab.gnome.org/GNOME/gnome-contacts.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-contacts
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gnome-contacts build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}