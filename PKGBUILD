pkgname=mfcoin-cli-bin
pkgver=3.0.0
pkgrel=1
provides=('mfcoin' 'mfcoin-daemon')
conflicts=('mfcoin-bin' 'mfcoin-git' 'mfcoin-cli-git')
reldate='05.10.19'
pkgdesc="MFCoin is a digital currency and blockchain service platform."
arch=('x86_64')
depends=("libevent>=2.1.8" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
url="https://mfcoin.net/"
license=('GPL3')
source_x86_64=("https://github.com/MFrcoin/MFCoin/releases/download/v.${pkgver}.${pkgrel}/mfcoin-linux.${reldate}.zip")
sha256sums_x86_64=('852423d7b44c83ffd172386176bf48df5f2d400410cab36315ddbc55844fe004')

_prep() {
    cp ./bin/mfcoin$1 $pkgdir/opt/mfcoin/bin/
    ln -s /opt/mfcoin/start $pkgdir/usr/bin/mfcoin$1
    cp ./share/man/man1/bitcoin$1.1 $pkgdir/share/man/man1/mfcoin$1.1 
}

package() {
    mkdir -p $pkgdir/opt/mfcoin/bin
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/share/man/man1
    cp ../start $pkgdir/opt/mfcoin/start
    cd $(ls -d */)
    cp -R ./utxo_snapshot ./genesis-reg.dat ./genesis-test.dat ./genesis.dat $pkgdir/opt/mfcoin/
    chmod 755 $pkgdir/opt/mfcoin/bin/* $pkgdir/opt/mfcoin/start
    _prep d
    _prep -cli
    cp ./include/mfcoinconsensus.h $pkgdir/usr/include/mfcoinconsensus.h
}
