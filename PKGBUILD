# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname=gnome-font-viewer
pkgname=gnome-font-viewer-git
pkgver=44.0+9+g54e4844
pkgrel=1
pkgdesc="A font viewer utility for GNOME"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
arch=(x86_64)
license=(GPL)
depends=(
  gnome-desktop-4
  gtk4
  libadwaita
)
makedepends=(
  git
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
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgname}"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
