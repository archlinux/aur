# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=gsettings-desktop-schemas-oldstable
pkgver=40.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop (oldstable version)"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
conflicts=("gsettings-desktop-schemas")
provides=("gsettings-desktop-schemas=$pkgver")
replaces=("gsettings-desktop-schemas")
license=(GPL)
depends=(glib2 dconf cantarell-fonts adobe-source-code-pro-fonts)
makedepends=(gobject-introspection git meson)
_commit=330c148978aa865851b0be3dd72f0817cbd94f31  # tags/40.0^0
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gsettings-desktop-schemas
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gsettings-desktop-schemas
}

build() {
  arch-meson gsettings-desktop-schemas build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
