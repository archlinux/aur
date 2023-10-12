# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=forgetpass
pkgdesc='Simple password generator for websites'
pkgver=1.0.14
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/alexkdeveloper/forgetpass"
license=('GPL3')
depends=('libadwaita' 'libgee')
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
