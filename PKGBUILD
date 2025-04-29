# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia-git
_pkgname="${pkgname%-*}"
pkgver=0.11.r1.g7b58a7e
pkgrel=1
pkgdesc='Set historic GNOME wallpapers'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/bertob/nostalgia'
license=('GPL-3.0-or-later')
provides=('nostalgia')
conflicts=('nostalgia')
depends=('gtk4' 'libadwaita' 'libportal' 'libportal-gtk4')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson --prefix /usr "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="${pkgdir}"
}

