# Maintainer: Your Name <youremail@example.com>
pkgname=runemaster-git
_pkgname=runemaster
pkgver=r18.c94847b
pkgrel=1
pkgdesc="A character viewer app made for GNOME."
arch=('any')
url="https://github.com/johnfactotum/runemaster"
license=('GPL3') # The repo includes a COPYING file, assuming GPL-3.0-or-later based on common practices for similar GNOME apps
depends=('gjs' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'pkg-config')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
