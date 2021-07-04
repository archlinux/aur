# Maintainer: Miguel Palencia <mike@qtum.org>

pkgname=qtum-core
pkgver=0.20.3
pkgrel=1
pkgdesc="Qtum Core is a Smart Contracts blockchain platform which makes use of UTXO and Proof of Stake."
arch=('x86_64')
url="https://qtum.org"
depends=('gcc')
makedepends=('gcc')
license=('MIT')
source=(https://github.com/qtumproject/qtum/archive/refs/tags/mainnet-fastlane-v$pkgver.tar.gz)
sha256sums=('622096ab9703d06c92df84dea502abc33d6c482acb39180e170062474de7ea7f')
provides=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')
conflicts=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')

build() {
 cd "$srcdir/qtum-mainnet-fastlane-v$pkgver"
 git clone --recursive https://github.com/qtumproject/cpp-eth-qtum.git src/cpp-ethereum 
 
 make -C depends 
DEPENDS="$srcdir/qtum-mainnet-fastlane-v$pkgver/depends/x86_64-pc-linux-gnu"

 ./autogen.sh
  ./configure --prefix=$DEPENDS \

  make


}

package() {

 cd "$srcdir/qtum-mainnet-fastlane-v$pkgver"
  sed -i -e 's/Bitcoin/Qtum/g' contrib/debian/qtum-qt.desktop
    install -Dm755 src/qt/qtum-qt "$pkgdir"/usr/bin/qtum-qt
    install -Dm755 src/qtumd "$pkgdir"/usr/bin/qtumd
    install -Dm755 src/qtum-cli "$pkgdir"/usr/bin/qtum-cli
    install -Dm755 src/qtum-wallet "$pkgdir"/usr/bin/qtum-wallet
    install -Dm755 src/qtum-tx "$pkgdir"/usr/bin/qtum-tx
    
    
    
    
  install -Dm644 contrib/debian/qtum-qt.desktop \
      "$pkgdir"/usr/share/applications/qtum.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/qtum128.png
    install -Dm644 contrib/debian/qtum-qt-testnet.desktop \
      "$pkgdir"/usr/share/applications/qtum-testnet.desktop
  install -Dm644 share/pixmaps/qtumtestnet128.png \
    "$pkgdir"/usr/share/pixmaps/qtumtestnet128.png

}



