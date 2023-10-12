# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=gomoku
pkgver=1.0.3
pkgrel=1
pkgdesc='A simple gomoku game'
url="https://github.com/alexkdeveloper/gomoku"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  ln -s io.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
