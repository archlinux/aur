pkgname=quick-lookup-git
_pkgname=quick-lookup
pkgver=r0.c0ffeeb
pkgrel=1
pkgdesc="A simple dictionary app made for GNOME."
arch=('any')
url="https://github.com/johnfactotum/quick-lookup"
license=('GPL3') # Assuming GPL-3.0-or-later based on the author's other projects
depends=('gjs' 'gtk4' 'libadwaita')
# Dependencies from README: gjs, gtk4 (>= 4.20), libadwaita (>= 1.7), libsoup (>= 3.0)
makedepends=('git' 'meson' 'ninja' 'pkg-config')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Build commands are standard for Meson projects
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  # Install commands are standard for Meson projects
  DESTDIR="${pkgdir}" meson install -C build
}
