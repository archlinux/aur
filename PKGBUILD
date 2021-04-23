# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdl2trs
_pkgname=sdltrs
pkgver=1.2.17
_commit=f4014145
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator (with hardware rendering)"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake')
source=("$url/-/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('SKIP')

build() {
  [[ -d builddir ]] && rm -r builddir
  cmake $_pkgname-$_commit \
        -Bbuilddir \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build builddir
}

package() {
  cd builddir
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_pkgname-$_commit/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
