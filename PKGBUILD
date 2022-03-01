# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gmult-git
pkgver=r98
pkgrel=1
pkgdesc="Multiplication Puzzle is a simple game inspired by the multiplication game inside the popular editor emacs"
arch=('x86_64')
url="https://git.launchpad.net/gmult"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('bzr' 'meson' 'vala' 'python-dulwich')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(bzr+lp:gmult)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s" "$(bzr revno)"
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
