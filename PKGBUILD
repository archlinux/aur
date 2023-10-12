# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=sudoku
pkgname=$_pkgname-gtk3
pkgver=1.0.7
pkgrel=1
pkgdesc='Sudoku game'
url="https://github.com/alexkdeveloper/sudoku"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('gtk3' 'qqwing')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  ln -s com.github.alexkdeveloper.$_pkgname "$pkgdir/usr/bin/$pkgname"
}
