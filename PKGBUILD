# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Janosch Dobler <janosch.dobler AT gmx DOT de>

pkgname=libgtkflow-git
pkgver=r497.c276040
pkgrel=1
pkgdesc="Flowgraphs for Gtk+3"
arch=('i686' 'x86_64')
url="https://notabug.org/grindhold/libgtkflow"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'meson' 'vala' 'valadoc' 'gobject-introspection')
optdepends=('python-gobject: usage from python'
            'lua-lgi: usage from lua')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-*}"
  rm -rf build
  mkdir build && cd build
  meson --prefix=/usr
  ninja
}

package() {
  cd "${srcdir}/${pkgname%-*}/build"
  DESTDIR="${pkgdir}" ninja install
}

# vim:set ts=2 sw=2 et:
