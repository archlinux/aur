# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname="tailor-gui"
pkgver="0.2.3"
pkgrel=1
pkgdesc="Graphical client for tailord (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs/"
license=('GPL2')
groups=('tuxedo-rs')
provides=(
  'tailor-gui'
)
depends=(
  'tailord'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'cargo'
  'meson'
  'git'
)
_commit_hash="74b863e" # v0.2.3
source=(
  "${pkgname}-${pkgver}"::"git+${url}#commit=${_commit_hash}"
)
sha256sums=('SKIP')
_archive="${pkgname}-${pkgver}"
_srcname="tailor_gui"

build() {
  cd ${_archive}

  meson setup --prefix=/usr "${_srcname}" build
  meson compile -C build
}

check() {
  cd "${_archive}"

  meson test -C build
}

package() {
  cd "${_archive}"

  meson install -C build --destdir "${pkgdir}"
}

# vim: sw=2 ts=2 et:
