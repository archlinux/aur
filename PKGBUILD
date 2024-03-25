# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=notepad
pkgver=1.2.6
pkgrel=1
pkgdesc='A simple notepad for GNU/Linux distributions'
url="https://github.com/alexkdeveloper/notepad"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson notepad build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.github.alexkdeveloper.notepad "$pkgdir/usr/bin/notepad.alexkdeveloper"
}
