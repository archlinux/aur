# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=notepad
pkgdesc='A simple notepad for GNU/Linux distributions'
pkgver=1.2.3
pkgrel=2
arch=('aarch64' 'x86_64')
url="https://github.com/alexkdeveloper/notepad"
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
  ln -s com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname.alexkdeveloper"
}
