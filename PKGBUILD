# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=libmixed
pkgver=2.4.1
pkgrel=1
epoch=0
pkgdesc="A real-time audio processing library"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/shirakumo/libmixed"
license=('zlib' 'BSD')
groups=('pro-audio')
options=(staticlibs)
source=("https://shirakumo.org/projects/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('1bd1dd0d8d1380051844e26a529c17bdb83ee049')

prepare() {
  mkdir -p "$pkgname-$pkgver/build/"
}

build() {
  cmake -S "$pkgname" -B "$pkgname-$pkgver/build" -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF
  cmake --build "$pkgname-$pkgver/build" -j
}

check() {
  cmake --build "$pkgname-$pkgver/build" -t run_tests
}

package() {
  cmake --install "$pkgname-$pkgver/build" --prefix "$pkgdir/"
}
