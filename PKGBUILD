# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=folly
pkgver=2018.07.02.00
pkgrel=2
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0')
makedepends=('cmake' 'gcc')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
'gtest-1.7.0.zip::https://github.com/google/googletest/archive/release-1.7.0.zip'
)
md5sums=('d5437e34a35ea65c93f730fc6fc5486d'
         'ef5e700c8a0f3ee123e2e0209b8b4961')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p _build
  cd _build
  cmake -DFOLLY_CXX_FLAGS='-Wno-error=class-memaccess' ..
  ln -sf $srcdir/googletest-release-1.7.0 gtest-1.7.0
}

build() {
  cd "$pkgname-$pkgver/_build"
  VERBOSE=1 make -j 4
}

check() {
  cd "$pkgname-$pkgver/_build"
}

package() {
  cd "$pkgname-$pkgver/_build"
  make DESTDIR="$pkgdir/" install
}
