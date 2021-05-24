# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=aldumb
pkgver=2.0.3
pkgrel=1
pkgdesc='Allegro 4 glue library for DUMB module player library'
arch=('x86_64' 'i686')
license=('custom: dumb' 'GPL')
url='https://github.com/kode54/dumb'
depends=('dumb' 'allegro4')
makedepends=('cmake' 'ninja')
source=($pkgname-$pkgver.tar.gz::"https://github.com/kode54/dumb/archive/$pkgver.tar.gz")
sha256sums=('99bfac926aeb8d476562303312d9f47fd05b43803050cd889b44da34a9b2a4f9')

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -B aurbuild -G Ninja dumb-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_ALLEGRO4=ON \
    -DBUILD_EXAMPLES=OFF
  cmake --build aurbuild
}

package() {
  DESTDIR="$pkgdir" cmake --install aurbuild
  install -Dm644 dumb-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # delete stuff present in `dumb` package
  rm -f "$pkgdir"/usr/include/dumb.h
  rm -f "$pkgdir"/usr/lib/libdumb*
  rm -rf "$pkgdir"/usr/lib/pkgconfig
}
