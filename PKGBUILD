# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=ricochet
pkgver=1.1.2
pkgrel=3
pkgdesc="Anonymous peer-to-peer instant messaging."
arch=('i686' 'x86_64')
url="https://ricochet.im/"
license=('custom')
depends=('tor' 'qt5-quick1' 'qt5-quickcontrols' 'qt5-declarative' 'openssl' 'protobuf' 'qt5-multimedia')
makedepends=('qt5-tools' 'pkg-config')
source=(https://ricochet.im/releases/$pkgver/$pkgname-$pkgver-src.tar.bz2{,.asc})
sha256sums=('97c78d088892e84c95a3e3a4a982883d8e44028848a513a5d7e0231d36325cc3'
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
