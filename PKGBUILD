# Maintainer: Dimitri Kaparis <dimitri at kaparis dot name>
# Contributor: redfish <redfish at galactica.pw>

pkgname=bitcoin-unlimited
pkgver=1.9.1.1
_pkgbase=BitcoinUnlimited-BCHunlimited${pkgver}
pkgrel=1
pkgdesc='Bitcoin Unlimited Cash (BCH) versions of Bitcoind, bitcoin-cli, 
bitcoin-tx, and bitcoin-qt, w/GUI and wallet'
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bitcoinunlimited.info"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'openssl')
optdepends=('miniupnpc' 'db4.8' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost' 'qt5-tools')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-unlimited-git' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=("https://github.com/BitcoinUnlimited/BitcoinUnlimited/archive/BCHunlimited${pkgver}.tar.gz")
install=$pkgname.install

build() {
  cd "$srcdir/$_pkgbase"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  
  make install DESTDIR=$pkgdir
  install -Dm644 "contrib/debian/bitcoin-qt.desktop" \
                 "$pkgdir/usr/share/applications/bitcoin.desktop"
  install -Dm644 "share/pixmaps/bitcoin128.png"\
                 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 "contrib/debian/manpages/bitcoin-qt.1" \
                 "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
  install -Dm644 "contrib/debian/examples/bitcoin.conf"\
                 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "contrib/debian/manpages/bitcoind.1"\
                 "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "contrib/debian/manpages/bitcoin.conf.5"\
                 "$pkgdir/usr/share/man/man5/bitcoin.conf.5"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

sha256sums=('18e38a77715baa32dda9049971def39f91b029a3b8308ccc3c7d90ef453fad03')
