# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=weather
pkgname=$_pkgname-gtk4
pkgdesc='Beautiful and lightweight weather app build using Gtk4, Libadwaita and Python'
pkgver=0.6.0
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://github.com/amit9838/weather"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
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
  cd "$pkgdir"
  mv usr/bin/$_pkgname usr/bin/$pkgname
  chmod +x usr/bin/$pkgname
  rm -dr app
}
