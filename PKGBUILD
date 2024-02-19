# Based on the file created for Arch Linux by:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>
# Contributor: Andrey Vetrov <vetrov at mail dot ru>
# Contributor: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
# Maintainer: DexterHaxxor <fox@dexterhaxxor.dev>

# shellcheck disable=SC2034
_pkgname="zenity"
pkgname="${_pkgname}-git"
pkgver=4.0.1.r11.gb19fa274
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts"
url="https://gitlab.gnome.org/GNOME/${_pkgname}.git"
arch=(x86_64)
license=(LGPL)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(gtk4 libadwaita)
makedepends=(meson yelp-tools help2man)
source=("${_pkgname}::git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --long --tags | sed 's/^ZENITY_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}" || exit
#  NOCONFIGURE=1 ./autogen.sh
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

# shellcheck disable=SC2154
package() {
  meson install -C build --destdir "${pkgdir}"
}
