# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=aldumb
pkgver=2.0.2
pkgrel=1
pkgdesc='Allegro 4 glue library for DUMB module player library'
arch=('x86_64' 'i686')
license=('custom: dumb' 'GPL')
url='https://github.com/kode54/dumb'
depends=('dumb' 'allegro4')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/kode54/dumb/archive/$pkgver.tar.gz")
sha256sums=('9e64eff5e4237a1e3c2cf2e8d5f75e3b54c2197fd5bc85a71a4741a5fd9c10f4')

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake ../dumb-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_ALLEGRO4=ON \
    -DBUILD_EXAMPLES=OFF
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 dumb-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # delete stuff present in `dumb` package
  rm -f "$pkgdir"/usr/include/dumb.h
  rm -f "$pkgdir"/usr/lib/libdumb*
  rm -rf "$pkgdir"/usr/lib/pkgconfig
}
