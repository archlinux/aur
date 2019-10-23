# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2019.10.21.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0')
makedepends=('cmake' 'gcc')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
'gtest-1.7.0.zip::https://github.com/google/googletest/archive/release-1.7.0.zip'
)
md5sums=('90565957ed02996446ffa00050572a86'
         'ef5e700c8a0f3ee123e2e0209b8b4961')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p _build
  cd _build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  ln -sf $srcdir/googletest-release-1.7.0 gtest-1.7.0
}

build() {
  cd "$pkgname-$pkgver"
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver/_build"
}

package() {
  cd "$pkgname-$pkgver/_build"
  make DESTDIR="$pkgdir/" install
}
