# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

_pkgname=gnome-backgrounds-macos
pkgname=$_pkgname-git
pkgver=r6.0cfa363
pkgrel=1
pkgdesc="Background images for the GNOME desktop from MacOS"
url="https://github.com/saltedcoffii/gnome-backgrounds-macos"
arch=(any)
makedepends=('glib2' 'meson' 'curl')
license=('CCPL:by-sa' 'GPL3 or any later version')
provides=('gnome-backgrounds' 'gnome-backgrounds-git' 'gnome-backgrounds-macos')
conflicts=('gnome-backgrounds-macos')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  $srcdir/$_pkgname/download-backgrounds.sh
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
