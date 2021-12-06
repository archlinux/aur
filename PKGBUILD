# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=gsettings-desktop-schemas-338
pkgver=3.38.0
pkgrel=2
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
conflicts=("gsettings-desktop-schemas")
provides=("gsettings-desktop-schemas=$pkgver")
replaces=("gsettings-desktop-schemas")
license=(GPL)
depends=(glib2 dconf cantarell-fonts adobe-source-code-pro-fonts)
makedepends=(gobject-introspection git meson)
_commit=bbb4e9d70bea13416a6f7558fddc75c0bb60739a  # tags/3.38.0^0
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
  DESTDIR="$pkgdir" meson install -C build
}
