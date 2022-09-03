# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=x11-emoji-picker
pkgver=0.10.0
pkgrel=2
pkgdesc='Linux XServer emoji picker written in C++.'
arch=('x86_64')
url="https://github.com/GaZaTu/x11-emoji-picker"
license=('MIT')
depends=('qt5-base' 'icu' 'xdotool')
makedepends=('cmake')
options=('!lto') # Disable LTO as linking process can max out RAM usage
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2027e19d56df9a12a1b13e13f20c1eeb98c8db66c129bb02ccae7dc70bb064e')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -Wno-dev
  cmake --build build -- -j 1 # Use one job as using multiple threads can max out RAM usage
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
