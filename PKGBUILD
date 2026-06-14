# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ministream-git
pkgver=0.99.0.r1.g486d7f1
pkgrel=1
pkgdesc="Minimal (subset) appstream metadata parser"
arch=(x86_64)
url="https://gitlab.gnome.org/sp1rit/ministream"
license=(LGPL-2.1-or-later)
depends=(
    appstream # run time
    glib2
    glibc
    gobject-introspection # run time (g-ir-scanner, g-ir-compiler)
    )
makedepends=(
    git
    meson
    ninja
    )
provides=(ministream)
conflicts=(ministream)
source=("git+https://gitlab.gnome.org/sp1rit/ministream.git")
sha256sums=('SKIP')

pkgver() {
  cd ministream
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ministream
  arch-meson build
  ninja -C build
}

package() {
  cd ministream
  DESTDIR="${pkgdir}" ninja -C build install
}
