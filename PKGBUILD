# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

_pkgname=gnome-backgrounds-macos
pkgname=$_pkgname
pkgver=42.0.2
pkgrel=0
pkgdesc="Background images for the GNOME desktop from MacOS"
url="https://github.com/saltedcoffii/gnome-backgrounds-macos"
arch=(any)
makedepends=('glib2' 'meson' 'curl')
license=('CCPL:by-sa' 'GPL3 or any later version')
provides=('gnome-backgrounds' 'gnome-backgrounds-git' 'gnome-backgrounds-macos-git')
conflicts=('gnome-backgrounds-macos-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9bfc1321b753bd97257e4edb447d6a9608200527fe0ccdec0e557a6271e7f3ce')

build() {
  $srcdir/$_pkgname-$pkgver/download-backgrounds.sh
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
