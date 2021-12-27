# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=libwebm
pkgver=1.0.0.28
pkgrel=1
pkgdesc="WebM video file parser"
url="https://www.webmproject.org/"
arch=('x86_64')
license=('BSD')
makedepends=('cmake')
source=("https://github.com/webmproject/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        cmake_install.patch)
sha256sums=('4df11d93260d3cd9f17c3697b0828d38400a8f87082183368df6a1ae7a9fc635'
            '708e0868cc32ff92ac418879f1ac409562047373b5a6ccfc4f8344279a763f0e')

prepare() {
  mkdir -p build
  cd $pkgname-$pkgname-$pkgver
  patch -p1 -i ../cmake_install.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_IWYU=ON \
    -DENABLE_WEBM_PARSER=ON \
    ../$pkgname-$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$pkgname-$pkgname-$pkgver
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
