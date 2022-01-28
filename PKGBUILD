# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=x11-emoji-picker
pkgver=0.9.0
pkgrel=1
pkgdesc='Linux XServer emoji picker written in C++.'
arch=('x86_64')
url="https://github.com/GaZaTu/x11-emoji-picker"
license=('MIT')
depends=('qt5-base' 'icu' 'xdotool')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0005945ddcea87c515f6887cef36c74b8b0533494ea456e06b7512180ae909d')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
