pkgname=mfcoin-bin
pkgver=3.0.0
pkgrel=1
provides=('mfcoin' 'mfcoin-daemon')
conflicts=('mfcoin-cli' 'mfcoin-git' 'mfcoin-cli-git')
reldate='05.10.19'
pkgdesc="MFCoin is a digital currency and blockchain service platform."
arch=('x86_64')    
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
url="https://mfcoin.net/"
license=('GPL3')
source_x86_64=("https://github.com/MFrcoin/MFCoin/releases/download/v.${pkgver}.${pkgrel}/mfcoin-linux.${reldate}.zip")
sha256sums_x86_64=('852423d7b44c83ffd172386176bf48df5f2d400410cab36315ddbc55844fe004')

_link() {
    ln -s /opt/mfcoin/start $pkgdir/usr/bin/mfcoin$1
}

package() {
    mkdir -p $pkgdir/opt/mfcoin
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/share/man/man1
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/icons
    cp ../start $pkgdir/opt/mfcoin/start
    cp ../mfcoin.desktop $pkgdir/usr/share/applications
    cp ../mfcoin.svg $pkgdir/usr/share/icons
    cd $(ls -d */)
    cp -R ./bin ./utxo_snapshot ./genesis-reg.dat ./genesis-test.dat ./genesis.dat $pkgdir/opt/mfcoin/
    chmod 755 $pkgdir/opt/mfcoin/bin/* $pkgdir/opt/mfcoin/start
    _link d
    _link -qt
    _link -tx
    _link -cli
    cp ./include/mfcoinconsensus.h $pkgdir/usr/include/mfcoinconsensus.h
    cp ./share/man/man1/bitcoind.1 $pkgdir/share/man/man1/mfcoind.1 
    cp ./share/man/man1/bitcoin-qt.1 $pkgdir/share/man/man1/mfcoin-qt.1
    cp ./share/man/man1/bitcoin-tx.1 $pkgdir/share/man/man1/mfcoin-tx.1
    cp ./share/man/man1/bitcoin-cli.1 $pkgdir/share/man/man1/mfcoin-cli.1
}
