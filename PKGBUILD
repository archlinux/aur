# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=somafm
pkgver=1.2.7
pkgrel=1
pkgdesc='A simple radio with built-in stations from the website somafm.com'
url="https://github.com/alexkdeveloper/somafm"
arch=('x86_64' 'aarch64')
license=('GPL3')
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
  DESTDIR="$pkgdir" meson install -C build
  ln -s com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
