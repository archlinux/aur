# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=sophus
pkgver=1.22.10
pkgrel=1
pkgdesc="C++ implementation of Lie Groups using Eigen"
arch=('x86_64' 'i686')
url="https://github.com/strasdat/Sophus"
license=('MIT')
depends=('eigen' 'fmt')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eb1da440e6250c5efc7637a0611a5b8888875ce6ac22bf7ff6b6769bbc958082')

build() {
  cd "Sophus-$pkgver"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_STANDARD=14 \
        -DBUILD_SOPHUS_TESTS=OFF \
        -DBUILD_SOPHUS_EXAMPLES=OFF \
        ..

  make
}

package() {
  cd "Sophus-$pkgver"/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
