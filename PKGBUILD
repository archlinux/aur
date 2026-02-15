# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.6+28+gc87aac4
pkgrel=4
pkgdesc="Easily send files via mail"
url="https://gitlab.gnome.org/Archive/nautilus-sendto"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(glib2)
makedepends=(gobject-introspection git meson appstream-glib)
_commit=c87aac46c4893e09b1ced1cca8bb86b0a6823124  # master
source=("git+https://gitlab.gnome.org/Archive/nautilus-sendto.git#commit=$_commit")
sha256sums=('e0798cfce848ba0979690273bdb636e26e6c6add42f6b12f018cc030ad1d96aa')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^NAUTILUS_SENDTO_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname

  # Fix Meson 0.61+ build
  sed -i -z "s/'appdata',\n\s\+//" src/meson.build
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
