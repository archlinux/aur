# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gmult
pkgver=13.0
pkgrel=1
pkgdesc="Multiplication Puzzle is a simple game inspired by the multiplication game inside the popular editor emacs"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/mterry/gmult"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('0b03e343fd21360e23b30de874723ab7d6883520b03ed3cddeb2ee7df231e0fc6af9a34c136c8c78defb82a65e020ca3fae6794f0ae6b0e3e0db478d36ce0710')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
