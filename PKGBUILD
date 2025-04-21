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
sha1sums=('2e415cb70323c88a90428764866ea17dcda4aca5')

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
  make run_tests
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
