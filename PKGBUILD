# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cmigemo
pkgver=1.8.0
pkgrel=1
pkgdesc='An implementation of Migemo in C'
arch=('i686' 'x86_64')
url='https://www.kaoriya.net/software/cmigemo/'
license=('MIT')
makedepends=('cmake' 'curl')
source=("https://github.com/koron/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b7c1661c7453844b4f1a316d1441477b3c898dae1feaf8db95fba4ca2d02e8e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir/" cmake --install build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"pkgname" LICENSE
}
