# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cmigemo
pkgver=1.5.2
pkgrel=1
pkgdesc='An implementation of Migemo in C'
arch=('i686' 'x86_64')
url='https://www.kaoriya.net/software/cmigemo/'
license=('MIT')
makedepends=('cmake' 'curl')
source=("https://github.com/koron/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e825da946fb28bf4ae28e61a0fa2be2069963749ef0740db704e871e09d9d925')

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
