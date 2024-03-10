# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=teleprompter
pkgver=0.1.7
pkgrel=1
pkgdesc='A simple Gtk4 application to read scrolling text from your screen'
url="https://github.com/Nokse22/teleprompter"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
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
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
