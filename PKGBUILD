# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mingle
pkgver=0.20
pkgrel=1
pkgdesc="A simple GTK4-Libadwaita app to play with Google's Emoji Kitchen."
arch=('x86_64')
url="https://github.com/halfmexican/mingle"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libgee'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e06519081e3407c7eb05bc6ceb5905f436ccd5bb0816bf127ca2ad461d0546d')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
