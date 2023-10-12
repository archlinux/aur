# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=guessnumber
pkgver=1.1.6
pkgrel=1
pkgdesc='A simple number guessing game'
url="https://github.com/alexkdeveloper/guessnumber"
arch=('x86_64')
license=('GPL3')
depends=('granite')
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
  ln -s com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
