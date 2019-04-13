# Maintainer: Miguel Palencia <mike@qtum.org>

pkgname=qtum-core
pkgver=0.17.3
pkgrel=1
pkgdesc="Qtum Core is a Smart Contracts blockchain platform which makes use of UTXO and Proof of Stake."
arch=('x86_64')
url="https://qtum.org"
depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode')
makedepends=('boost' 'qt5-tools' 'miniupnpc' 'qrencode' 'zeromq' 'git')
license=('MIT')
source=(https://github.com/qtumproject/qtum/archive/mainnet-ignition-v$pkgver.tar.gz )
sha256sums=('8f8355c18bd6862c8195ddcfcc6fcd2622cb82dde07352700de28ab6b58305d0')
provides=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')
conflicts=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')

build() {
 cd "$srcdir/qtum-mainnet-ignition-v$pkgver"
 git clone https://github.com/qtumproject/cpp-eth-qtum.git src/cpp-ethereum 
 ./autogen.sh
  ./configure \
    --prefix=/usr/ \
    --with-incompatible-bdb \

  make
}

package() {

 cd "$srcdir/qtum-mainnet-ignition-v$pkgver"
  sed -i -e 's/Bitcoin/Qtum/g' contrib/debian/qtum-qt.desktop
  install -Dm755 src/qt/qtum-qt "$pkgdir"/usr/bin/qtum-qt
  install -Dm644 contrib/debian/qtum-qt.desktop \
    "$pkgdir"/usr/share/applications/qtum.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/qtum128.png

}



