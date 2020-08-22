# Maintainer: Nicolas Hafner <shinmera@tymoon.eu>
pkgname=libmixed
pkgver=2.0
pkgrel=1
epoch=0
pkgdesc="A real-time audio processing library"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/shirakumo/libmixed"
license=('zlib' 'BSD')
groups=('pro-audio')
options=(staticlibs)
source=("https://github.com/Shirakumo/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('2022187c64b831c38f0841a3822803eae204eaf8')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p "build/"
}

build() {
  cd "$pkgname-$pkgver/build"
  cmake ".." -DBUILD_EXAMPLES=OFF
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
