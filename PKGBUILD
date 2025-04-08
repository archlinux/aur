# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=jome
pkgver=1.2.0
pkgrel=1
pkgdesc='Keyboard centric emoji picker desktop application'
arch=(i686 x86_64)
url=https://github.com/eepp/jome
license=(MIT)
depends=(qt5-base)
makedepends=(qt5-base 'cmake>=3.30.0' 'boost>=1.70.0')
source=(https://github.com/eepp/jome/archive/refs/tags/v${pkgver}.tar.gz)
sha1sums=(c81d4f4dd6196ce0fff6e32ac40c741a40ec1abc)

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
