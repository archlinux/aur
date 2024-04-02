# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname="tailor-gui"
pkgver="0.2.5"
pkgrel=1
pkgdesc="Graphical client for tailord (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs/"
license=('GPL-2.0-or-later')
groups=('tuxedo-rs')
provides=(
  'tailor-gui'
)
depends=(
  'tailord=0.2.5'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'cargo'
  'meson'
  'git'
)
# NOTE: Source needs to correspond to tailord's source
_tailord_tag="tailord-v0.2.5"
source=(
  "${pkgname}"::"git+${url}#tag=${_tailord_tag}"
)
sha256sums=(
  'cf33972732601cd9e0f2502689a2f7620ba5fc886174e84f9192bbd5c8e801a1'
)

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
