# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=libmixed
pkgver=2.3.1
pkgrel=1
epoch=0
pkgdesc="A real-time audio processing library"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/shirakumo/libmixed"
license=('zlib' 'BSD')
groups=('pro-audio')
options=(staticlibs)
source=("https://github.com/Shirakumo/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('63d11fc09d1cb71b4a7bb7286eee3e77c0d5eb56')

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
