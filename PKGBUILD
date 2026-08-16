# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cmigemo
pkgver=1.6.1
pkgrel=1
pkgdesc='An implementation of Migemo in C'
arch=('i686' 'x86_64')
url='https://www.kaoriya.net/software/cmigemo/'
license=('MIT')
makedepends=('cmake' 'curl')
source=("https://github.com/koron/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e76a618fe28852ca1ba538641776a28d51e449efe9a55abeac2920e21591ba8')

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
