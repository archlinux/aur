# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.22
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bc0d49020e736ac7954570908bf04ac3395c56930001e4e5173b6b6f5b6a2b595721dadfee776596fbbb71111ee197ef83edf96c92434ef2fb0d3e6a095854f9')

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
