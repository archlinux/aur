# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=jome
pkgver=1.1.0
pkgrel=1
pkgdesc='Emoji picker desktop application'
arch=(i686 x86_64)
url=https://github.com/eepp/jome
license=(MIT)
depends=(qt5-base)
makedepends=(qt5-base 'cmake>=3.30.0' 'boost>=1.70.0')
source=(https://github.com/eepp/jome/archive/refs/tags/v${pkgver}.tar.gz)
sha1sums=(71f1434bf39f821508746e8bebf5b234b0946441)

build() {
  cmake -S "${srcdir}/${pkgname}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${srcdir}/${pkgname}-${pkgver}/LICENSE"
}
