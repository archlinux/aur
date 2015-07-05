# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Michael Kanis <mkanis gmx de>
# Contributor: Paulo Freire <paulofreire gmail com>
# Contributor: Brice Maron <brice bmaron net>

pkgname=merkaartor
pkgver=0.18.1
pkgrel=2
pkgdesc='OpenStreetMap editor'
url='http://merkaartor.be/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('desktop-file-utils' 'exiv2' 'gdal' 'hicolor-icon-theme' 'qtwebkit')
optdepends=('gpsd' 'libproxy')
install="$pkgname.install"
source=("https://github.com/openstreetmap/merkaartor/archive/$pkgver.tar.gz")
sha256sums=('e9fa5e30e6392c9224f73e9bb7d17b66c4eb6c023633eb2af0cf58ba8acf684f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  echo 'QMAKE_MOC = $$QMAKE_MOC -DBOOST_TT_HAS_OPERATOR_HPP_INCLUDED' >> src/src.pro
  lrelease-qt4 src/src.pro
  qmake-qt4 Merkaartor.pro \
    PREFIX="/usr" \
    GEOIMAGE=1 \
    NODEBUG=1 \
    RELEASE=1 \

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
