# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=libmixed
pkgver=2.3
pkgrel=1
epoch=0
pkgdesc="A real-time audio processing library"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/shirakumo/libmixed"
license=('zlib' 'BSD')
groups=('pro-audio')
options=(staticlibs)
source=("https://github.com/Shirakumo/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('d205cbd6783332a212c5ae92d73c77178c2d2f28')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p "build/"
}

build() {
  cd "$pkgname-$pkgver/build"
  cmake ".." -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF
  make
}

check() {
  cd "$pkgname-$pkgver/build"
  make test
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
