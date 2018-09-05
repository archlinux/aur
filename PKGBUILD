# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.6+14+ge8a3604
pkgrel=1
pkgdesc="Easily send files via mail"
url="https://gitlab.gnome.org/GNOME/nautilus-sendto"
arch=(x86_64)
license=(GPL)
depends=(glib2)
makedepends=(gobject-introspection git meson appstream-glib)
groups=(gnome-extra)
_commit=e8a3604c69e178dc379c04d6f0684c9e1a60532a  # master
source=("git+https://gitlab.gnome.org/GNOME/nautilus-sendto.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^NAUTILUS_SENDTO_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
