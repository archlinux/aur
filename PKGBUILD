# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

pkgname=gnome-backgrounds-macos-git
pkgver=r6.0cfa363
pkgrel=0
pkgdesc="Background images for the GNOME desktop from MacOS"
url="https://github.com/saltedcoffii/gnome-backgrounds-macos"
arch=(any)
makedepends=('glib2' 'meson' 'curl')
license=('CCPL:by-sa' 'GPL3 or any later version')
provides=('gnome-backgrounds' 'gnome-backgrounds-git' 'gnome-backgrounds-macos')
conflicts=('gnome-backgrounds-macos')
source=('git+https://github.com/saltedcoffii/$pkgname.git')
sha256sums=('SKIP')

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
