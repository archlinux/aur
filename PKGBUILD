# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=daikhan
pkgver=0.1_alpha4
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A media player for the modern desktop"
arch=('x86_64')
url="https://gitlab.com/daikhan/daikhan"
license=('GPL-3.0-or-later')
depends=('gst-plugin-gtk4' 'libadwaita' 'xxhash')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream')
source=("https://gitlab.com/daikhan/$pkgname/-/archive/$_pkgver/$pkgname-$_pkgver.tar.bz2")
sha256sums=('958009a53b9054974ffc9c76020552ad6239851cb10c2c9f8cefa53d8dcf6143')

build() {
  arch-meson -Dprofile=stable "$pkgname-$_pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
