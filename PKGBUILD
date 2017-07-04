# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=gridcoinresearchd
pkgver=3.5.9.1a
pkgrel=1
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - daemon"
depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
makedepends=('boost' 'db')

replaces=('gridcoinresearch-daemon')
conflicts=('gridcoinresearch-daemon')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("gridcoinresearch-${pkgver}.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/${pkgver}.tar.gz")

sha256sums=('5249c70c27736084499394f85bd75321873b096761701cf1d2e2682ce1260642')

prepare() {
  mkdir -p "$srcdir/$_sourcename/src/obj"

  chmod 755 "$srcdir/$_sourcename/src/leveldb/build_detect_platform"
}

build() {
  cd "$srcdir/$_sourcename/src"

  make -f makefile.unix DEBUGFLAGS="" USE_UPNP=1
}

package() {
  cd "$srcdir/$_sourcename/src"

  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

