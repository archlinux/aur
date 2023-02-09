# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=x11-emoji-picker
pkgver=0.13.0
pkgrel=1
pkgdesc="Linux XServer emoji picker written in C++."
arch=('x86_64')
url="https://github.com/GaZaTu/x11-emoji-picker"
license=('MIT')
depends=('qt5-base' 'icu' 'xdotool')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecf7652825ba3430627545c15c766121df7b3200d25970bf9f69b02c701d3ea3')

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
