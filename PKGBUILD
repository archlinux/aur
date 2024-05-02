# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.29
pkgrel=1
arch=('x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD-2-Clause')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('194e202bd5c10acdccc29f4a61770b47805b3bc2e7e9180c2cb5340c8511fbffce7d95f1a46bfd4466726a4ad5b3c5b280042bcefc9b40729beed05cbed64ead')

build() {
  cmake $pkgname-$pkgver \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
