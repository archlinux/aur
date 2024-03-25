# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=recorder
pkgver=1.0.17
pkgrel=1
pkgdesc='Simple audio recorder'
url="https://github.com/alexkdeveloper/recorder"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gstreamer' 'libadwaita' 'libpulse')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
