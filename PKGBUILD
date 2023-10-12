# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=goldsearch
pkgver=1.0.11
pkgrel=1
pkgdesc='A game in which you need to look for gold'
url="https://github.com/alexkdeveloper/goldsearch"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('gstreamer' 'libadwaita')
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
