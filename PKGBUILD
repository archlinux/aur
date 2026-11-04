# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname="tailor-gui"
pkgver=0.2.5
pkgrel=2
pkgdesc="Graphical client for tailord (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs/"
license=('GPL-2.0-or-later')
groups=('tuxedo-rs')
provides=(
  'tailor-gui'
)
_tailord_ver="0.3.0"
depends=(
  "tailord=${_tailord_ver}"
  "gtk4"
  "libadwaita"
)
makedepends=(
  'cargo'
  'meson'
  'git'
)
# NOTE: Source needs to correspond to tailord's source
source=(
  "${pkgname}"::"git+${url}#tag=tailord-v${_tailord_ver}"
)
sha256sums=('50ceaa0040abfd515c7b2532f6969bb5b6392fb4dc71c6e63016e453a6294970')

_srcname="tailor_gui"

build() {
  cd "${pkgname}/${_srcname}"

  meson setup --prefix=/usr build
  meson compile -C build
}

check() {
  cd "${pkgname}/${_srcname}"

  meson test -C build
}

package() {
  cd "${pkgname}/${_srcname}"

  meson install -C build --destdir "${pkgdir}"
}

# vim: sw=2 ts=2 et:
