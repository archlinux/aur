# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-contacts-git
pkgver=3.36.r15.gb6cb216
pkgrel=1
pkgdesc="Contacts Manager for GNOME"
url="https://wiki.gnome.org/Apps/Contacts"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL2)
depends=(gtk3 folks gnome-desktop dconf gnome-online-accounts libgee cheese libhandy)
makedepends=(vala gobject-introspection git meson)
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
  arch-meson gnome-contacts build -D docs=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
