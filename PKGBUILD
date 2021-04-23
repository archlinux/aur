# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdltrs
pkgver=1.2.17
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('49d295b3229d43712fafb7d67b692c494615e6e1bc03adcd5fafa2399e8d98544b61a1bbcab399c80c3dcfd79a228c3632ff625db540cd78f90f0d3958f1d41c')

build() {
  [[ -d builddir ]] && rm -r builddir
  cmake $pkgname-$pkgver \
        -Bbuilddir \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build builddir
}

package() {
  cd builddir
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
