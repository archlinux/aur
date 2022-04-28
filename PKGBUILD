# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

pkgname=gnome-backgrounds-macos
pkgver=42.0
pkgrel=0
pkgdesc="Background images for the GNOME desktop from MacOS"
url="https://github.com/saltedcoffii/gnome-backgrounds-macos"
arch=(any)
makedepends=('glib2' 'meson>=0.50.0' 'curl')
license=('CCPL:by-sa' 'GPL3 or any later version')
provides=('gnome-backgrounds' 'gnome-backgrounds-git' 'gnome-backgrounds-macos-git')
conflicts=('gnome-backgrounds-macos-git')
source=('https://github.com/saltedcoffii/$pkgname/archive/$pkgver.tar.gz')
sha256sums=('c7b9e63d6d204297d0e0e281739e38ff98b8a382294aaff99a1422193c3686da')

build() {
  $srcdir/$pkgname-$pkgver/download-backgrounds.sh
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
