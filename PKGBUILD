# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=ricochet
pkgver=1.1.0
pkgrel=4
pkgdesc="Anonymous peer-to-peer instant messaging."
arch=('i686' 'x86_64')
url="https://ricochet.im/"
license=('custom')
depends=('tor' 'qt5-quick1' 'qt5-quickcontrols' 'qt5-declarative' 'openssl' 'protobuf')
makedepends=('qt5-tools' 'pkg-config')
source=(https://github.com/ricochet-im/ricochet/archive/v$pkgver.tar.gz)
sha256sums=('ab372c46a274825aa51ecc416966bee44fd69088fbc4b9f68fff46967a1becd9')

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
