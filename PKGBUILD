# Based on the file created for Arch Linux by:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Ionut Biru <ibiru@archlinux.org>
# Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Adam Hani Schakaki (krzd) <krzd@krzd.net>
# Maintainer: Andrey Vetrov <vetrov at mail dot ru>

pkgname=gsettings-desktop-schemas-git
pkgver=3.36.0.r2.g4e4bb62
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
license=(GPL)
provides=("gsettings-desktop-schemas=$pkgver")
conflicts=('gsettings-desktop-schemas')
replaces=('gsettings-desktop-schemas')
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname:0:25}
  # git describe --tags | sed 's/-/+/g'
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname:0:25}
}

build() {
  arch-meson ${pkgname:0:25} build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
