# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=weather-gtk4
pkgver=1.0.1
pkgrel=1
pkgdesc='Beautiful and lightweight weather app build using Gtk4, Libadwaita and Python'
url="https://github.com/amit9838/weather"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson weather build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  cd "$pkgdir"
  mv usr/bin/weather usr/bin/$pkgname
  sed -i -E "s|Exec=weather|Exec=$pkgname|g" usr/share/applications/io.github.amit9838.weather.desktop
  chmod +x usr/bin/$pkgname
  rm -dr app
}
