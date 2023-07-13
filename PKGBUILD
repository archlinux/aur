# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=x11-emoji-picker
pkgver=0.15.0
pkgrel=1
pkgdesc="Linux XServer emoji picker written in C++."
arch=('x86_64')
url="https://github.com/GaZaTu/x11-emoji-picker"
license=('MIT')
depends=('qt5-base' 'xdotool')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8888f21941ed7404b394e43a4771c8880acb4d5f210dc01fab2a4a4d000b6d4b')

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
