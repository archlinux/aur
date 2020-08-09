# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.6+28+gc87aac4
pkgrel=1
pkgdesc="Easily send files via mail"
url="https://gitlab.gnome.org/Archive/nautilus-sendto"
arch=(x86_64)
license=(GPL)
depends=(glib2)
makedepends=(gobject-introspection git meson appstream-glib)
_commit=c87aac46c4893e09b1ced1cca8bb86b0a6823124  # master
source=("git+https://gitlab.gnome.org/Archive/nautilus-sendto.git#commit=$_commit")
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
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
