# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cmigemo
pkgver=1.7.1
pkgrel=1
pkgdesc='An implementation of Migemo in C'
arch=('i686' 'x86_64')
url='https://www.kaoriya.net/software/cmigemo/'
license=('MIT')
makedepends=('cmake' 'curl')
source=("https://github.com/koron/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8cae9956b3ba411dfa5421d89e43b88b111d8ca764e4c4dbfa7df2a16699023a')

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
