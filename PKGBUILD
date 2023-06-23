# Based on the file created for Arch Linux by:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Ionut Biru <ibiru@archlinux.org>
# Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Adam Hani Schakaki (krzd) <krzd@krzd.net>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Andrey Vetrov <vetrov at mail dot ru>

_pkgname="gsettings-desktop-schemas"
pkgname="${_pkgname}-git"
pkgver=44.0.r6.g3e99898
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
license=(GPL)
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
depends=(
  glib2
  dconf
  cantarell-fonts
  adobe-source-code-pro-fonts)
makedepends=(gobject-introspection git meson)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname:0:25}
  # git describe --tags | sed 's/-/+/g'
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname:0:25}
}

build() {
  arch-meson ${_pkgname:0:25} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
