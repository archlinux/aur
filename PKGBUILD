# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=easter
pkgver=1.2.1
pkgrel=1
pkgdesc='Simple password generator for websites'
url="https://github.com/alexkdeveloper/easter"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('libadwaita')
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
