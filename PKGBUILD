# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=gridcoinresearch-qt
pkgver=3.5.8.8b
pkgrel=1
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - Qt"
depends=('boost-libs' 'qrencode' 'qt5-base' 'libzip' 'miniupnpc' 'curl' 'boinc')
makedepends=('boost' 'qt5-tools' 'qrencode' 'db')

arch=('i686' 'x86_64' 'armv7h')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("gridcoinresearch-${pkgver}.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/${pkgver}.tar.gz"
        'gridcoinresearch-qt.desktop')

sha256sums=('601190f4438f8be762bfeea1dfd50d5fad4cd916c2c5bc92e24ae31b417bdcd6'
          '1c547e531726d3172895683f9673379fc51639689989e49494aa0f40fc6cb053')

build() {
  cd "$srcdir/$_sourcename"

  qmake USE_QRCODE=1 USE_UPNP=1 NO_UPGRADE=1
  make
}

package() {
  cd "$srcdir/$_sourcename"

  install -Dm755 gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"
  install -Dm644 share/pixmaps/grc-small.png "$pkgdir/usr/share/pixmaps/grc-small.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

