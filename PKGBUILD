# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>

pkgname=skiff-desktop
pkgver=0.2.0
pkgrel=1
pkgdesc="Skiff, now on a Linux Desktop near you!"
arch=('x86_64' 'aarch64')
depends=('libhelium' 'webkitgtk-6.0' 'json-glib')
makedepends=(
  'git'
  'meson'
  'ninja'
  'vala'
)
url="https://github.com/FyraLabs/skiff-desktop"
license=('GPL3')

source=("$pkgname-$pkgver.tar.gz::https://github.com/FyraLabs/skiff-desktop/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5183f28b2c12703aacef117905d87ea26e6164480cf6a66aad897c30378099f3')

prepare() {
  cd "$srcdir/skiff-desktop-$pkgver"

  meson subprojects download
}

build() {
  cd "$srcdir/skiff-desktop-$pkgver"

  arch-meson . builddir
  meson compile -C builddir
}

package() {
  cd "$srcdir/skiff-desktop-$pkgver"

  meson install -C builddir --destdir "$pkgdir"
  rm -rf "$pkgdir/usr/share/glib-2.0"
}
