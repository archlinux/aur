# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=gridcoinresearch-qt
pkgver=3.5.8.9
pkgrel=1
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - Qt"
depends=('boost-libs' 'qrencode' 'qt5-base' 'libzip' 'miniupnpc' 'curl' 'boinc')
makedepends=('boost' 'qt5-tools' 'qrencode' 'db')

arch=('i686' 'x86_64' 'armv7h')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("gridcoinresearch-${pkgver}.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/${pkgver}.tar.gz"
        'gridcoinresearch-qt.desktop'
        '0001-Openssl-1.1.0-185.patch')

sha256sums=('7e637f6a7d9b10d3df3bb183611d8094dadb1e884c1e5fba860adfb338686d60'
            '1c547e531726d3172895683f9673379fc51639689989e49494aa0f40fc6cb053'
            '6aec7fc3612444cdf5b837c82177268f29aba4f9b6bb4a8c47a7d6fca831b42c')

prepare() {
  cd "$srcdir/$_sourcename"
  patch -Np1 -i "$srcdir/0001-Openssl-1.1.0-185.patch"
}

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

