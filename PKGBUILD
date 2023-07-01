# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname="gnome-characters"
pkgname="${_pkgname}-git"
pkgver=44.0+31+g142609f
pkgrel=1
pkgdesc="A character map application"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
  armv6l
)
license=(GPL2)
depends=(
  emoji-font
  gjs
  gnome-desktop-4
  gtk4
  libadwaita
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  gperf
  meson
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
groups=(
  gnome
  gnome-git
)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
