# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.32
pkgrel=1
arch=('x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD-2-Clause')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('e9635dcfb09edc1d4e2e4d178995db1fd0e90e8bafa4383316bc95409629d684ebec95c9fb1ac0dd34caa9b26a139b7319b019599df805861aec566db0459186')

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
