# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=jome
pkgver=1.3.0
pkgrel=1
pkgdesc='Keyboard centric emoji picker desktop application'
arch=(i686 x86_64)
url=https://github.com/eepp/jome
license=(MIT)
depends=(qt5-base)
makedepends=(qt5-base 'cmake>=3.30.0' 'boost>=1.70.0')
source=(https://github.com/eepp/jome/releases/download/v$pkgver/jome-$pkgver.tar.gz)
sha1sums=(886c18895a6222841f96a88b00c6356260fd50f6)

build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
