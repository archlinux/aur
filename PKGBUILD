# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=radio
pkgver=1.0.11
pkgrel=1
pkgdesc='Simple Radio for Linux'
url="https://github.com/alexkdeveloper/radio"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('gstreamer' 'json-glib' 'libadwaita' 'libgee' 'libpulse' 'libsoup')
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
  DESTDIR="$pkgdir" meson install -C build
  ln -s io.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
