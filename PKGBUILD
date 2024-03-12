# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=trivia-quiz
pkgver=0.2.0
pkgrel=1
pkgdesc='Respond to endless questions'
url="https://github.com/Nokse22/trivia-quiz"
license=('GPL-3.0-or-later')
arch=('aarch64' 'x86_64')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
