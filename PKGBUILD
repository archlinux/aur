# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gmult
pkgver=12.0
pkgrel=1
pkgdesc="Multiplication Puzzle is a simple game inspired by the multiplication game inside the popular editor emacs"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/mterry/gmult"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('daafb02c0fdbb09cd9e3334296052427caf659c1209340568fa8465a76fa6a30a8e0a33e88a7d412e16e1e5142f2c180efd2299eb5e831f69549afdcf7f87062')

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
