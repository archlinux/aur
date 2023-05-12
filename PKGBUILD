# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gmult-git
pkgver=12.0.r0.g98ea682
pkgrel=1
pkgdesc="Multiplication Puzzle is a simple game inspired by the multiplication game inside the popular editor emacs"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/mterry/gmult"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
