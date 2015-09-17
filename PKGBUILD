# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=ricochet
pkgver=1.1.1
pkgrel=3
pkgdesc="Anonymous peer-to-peer instant messaging."
arch=('i686' 'x86_64')
url="https://ricochet.im/"
license=('custom')
depends=('tor' 'qt5-quick1' 'qt5-quickcontrols' 'qt5-declarative' 'openssl' 'protobuf' 'qt5-multimedia')
makedepends=('qt5-tools' 'pkg-config')
source=(https://ricochet.im/releases/$pkgver/$pkgname-$pkgver-src.tar.bz2{,.asc})
sha256sums=('1aae4c1d1b836a576dde707d3af8898eb068ba5f95c0eda98b108208f17cfba0'
            'SKIP')
validpgpkeys=('9032CAE4CBFA933A5A2145D5FF97C53F183C045D')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  QT_SELECT=5 qmake CONFIG+=release DEFINES+=RICOCHET_NO_PORTABLE
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  INSTALL_ROOT="${pkgdir}" make install
}
