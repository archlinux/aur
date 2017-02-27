# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=('gridcoinresearchd')
pkgver=3.5.8.6
pkgrel=3
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC"
arch=('i686' 'x86_64' 'armv7h')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

makedepends=('boost' 'openssl' 'libzip' 'db' 'curl' 'miniupnpc')
source=("gridcoinresearch-${pkgver}.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/${pkgver}.tar.gz")

sha256sums=('d798ea60f87d4daf78c154dde650f0cb08cc28cc34fa8ee876c2e37948efb393')

prepare() {
  cd "$srcdir/$_sourcename"

  mkdir -p src/obj

  chmod 755 src/leveldb/build_detect_platform
}

build() {
  cd "$srcdir/$_sourcename"

  cd src

  make ${MAKEFLAGS} -f makefile.unix DEBUGFLAGS="" USE_UPNP=1
}

package_gridcoinresearchd() {
  pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - Daemon"
  depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
  replaces=('gridcoinresearch-daemon')
  conflicts=('gridcoinresearch-daemon')
  install=gridcoin.install

  cd "$srcdir/$_sourcename/src"
  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

