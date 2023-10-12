# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=dice
pkgname=$_pkgname-gtk4
pkgver=1.0.9
pkgrel=1
pkgdesc='A simple dice game'
url="https://github.com/alexkdeveloper/dice"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('libadwaita')
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
