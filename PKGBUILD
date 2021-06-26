# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.19
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('96a129a590d581073c71fb5af71087c703752f95a61707e6eb78fa73472c878cdb0b8f3e71b52e6d2315ee18821b675bae887fb70707eedeeac0c8b4e277adf0')

build() {
  [[ -d build ]] && rm -r build
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
