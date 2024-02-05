# Maintainer: Evert Vorster < evorster AT gmail DOT com>
# Contributor: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname="tailor-gui-git"
pkgver=tailor.v0.3.0.r18.f7fb6e4
pkgrel=1
pkgdesc="Graphical client for tailord (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs/"
license=('GPL2')
groups=('tuxedo-rs')
provides=(
  'tailor-gui'
)
conficts=(
  'tailor-gui' 'tuxedo-control-center-bin' 'tuxedo-control-center-runit'
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
source=(
  "${pkgname}"::"git+${url}"
)
sha256sums=('SKIP')
_archive="${pkgname}"
_srcname="tailor_gui"
pkgver() {
  cd ${_archive}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

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
