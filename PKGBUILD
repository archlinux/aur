# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=libwebm
pkgver=1.0.0.32
pkgrel=1
pkgdesc="WebM video file parser"
url="https://www.webmproject.org/"
arch=('x86_64' 'aarch64')
license=('BSD')
makedepends=('cmake')
source=("https://github.com/webmproject/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7fd5e085bda9f8031cf2ad2a1e52d9b7b29cba9c0b96ad2ce794ce89e4249eb8')

build() {
  mkdir build && cd build
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
