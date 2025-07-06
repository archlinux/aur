# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=radio
pkgver=1.0.16
pkgrel=1
pkgdesc='Simple Radio for Linux'
url="https://github.com/alexkdeveloper/radio"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gst-plugins-bad-libs' 'json-glib' 'libadwaita' 'libgee' 'libpulse' 'libsoup')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6f060a8df6d10b9992a41fc685ccb4e3c83758fa78619c0b2ce3730652e910da')

build() {
  arch-meson radio-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s io.github.alexkdeveloper.radio "$pkgdir/usr/bin/radio"
}
