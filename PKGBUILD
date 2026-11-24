# Maintainer: johnpetersa19 <johnppetersa at gmail dot com>

pkgname=temporal-explorer
pkgver=0.3.0
pkgrel=1
pkgdesc='Browse Git repository history as a time-navigable file tree'
arch=('x86_64' 'aarch64')
url='https://github.com/johnpetersa19/Temporal-Explorer'
license=('GPL-3.0-or-later')
options=('!debug' '!lto')
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'openssl'
  'zlib'
)
makedepends=(
  'blueprint-compiler'
  'gettext'
  'meson'
  'rust'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=('temporal-explorer-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b80537a4ea15a28b33f40b44385258a02c4eb5155bcad8aadae5054bbfda7389')

build() {
  arch-meson "Temporal-Explorer-$pkgver" build --buildtype=release
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "Temporal-Explorer-$pkgver/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
