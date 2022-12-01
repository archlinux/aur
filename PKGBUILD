# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

_pkgname=gnome-backgrounds-macos
pkgname=$_pkgname
pkgver=43.0.0
pkgrel=1
pkgdesc="Background images for the GNOME desktop from MacOS"
url="https://github.com/saltedcoffii/gnome-backgrounds-macos"
arch=(any)
makedepends=('glib2' 'meson' 'curl')
license=('CCPL:by-sa' 'GPL3 or any later version' 'custom')
provides=('gnome-backgrounds' 'gnome-backgrounds-git' 'gnome-backgrounds-macos-git')
conflicts=('gnome-backgrounds-macos-git')
source=("git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd $srcdir/$_pkgname
  git submodule update --init
  ./download-backgrounds.sh
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

  install -Dm644 $srcdir/$_pkgname/COPYING.md "${pkgdir}"/usr/share/licenses/$_pkgname/COPYING.md
}
