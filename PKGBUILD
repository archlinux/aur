# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=x11-emoji-picker
pkgver=0.12.1
pkgrel=1
pkgdesc="Linux XServer emoji picker written in C++."
arch=('x86_64')
url="https://github.com/GaZaTu/x11-emoji-picker"
license=('MIT')
depends=('qt5-base' 'icu' 'xdotool')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3958614582938d979c008f8b25d44a8cd97b4bc5267cc1524986b6c3e065515')

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
