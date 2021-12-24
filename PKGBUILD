# Maintainer: Claudio Kozický <claudiokozicky@gmail.com>
# Contributor: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-cli' 'peercoin-daemon' 'peercoin-qt' 'peercoin-tx')
pkgbase='peercoin'
pkgver=0.11.3
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency"
arch=('x86_64')
url="https://www.peercoin.net/"
license=('MIT')
depends=('boost-libs' 'db' 'libevent' 'miniupnpc' 'openssl' 'qrencode' 'qt5-base' 'zeromq')
makedepends=('boost' 'qt5-tools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/peercoin/peercoin/archive/v${pkgver}ppc.tar.gz")
b2sums=('9922cb3748475168ee93ff76117eecd83710ead24eb941b33ef56dc2058fd78e76d6ce9a4ce82d982a573a12e7db20599236d593403c1058de949ee741bfeaff')

build() {
    cd "$pkgbase-${pkgver}ppc"
    ./autogen.sh
    ./configure --prefix /usr --with-incompatible-bdb
    make
}

check() {
    cd "$pkgbase-${pkgver}ppc"
    make --keep-going check
}

package_peercoin-cli() {
    pkgdesc="A peer-to-peer network-based digital currency - RPC client"
    depends=('boost-libs' 'libevent')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/peercoin-cli.bash-completion \
            "$pkgdir/usr/share/bash-completion/completions/peercoin-cli"
    install -D --mode 644 \
            doc/man/peercoin-cli.1 \
            "$pkgdir/usr/share/man/man1/peercoin-cli.1"
    install -D --mode 755 \
            src/peercoin-cli \
            "$pkgdir/usr/bin/peercoin-cli"
}

package_peercoin-daemon() {
    pkgdesc="A peer-to-peer network-based digital currency - daemon"
    depends=('boost-libs' 'db' 'libevent' 'miniupnpc' 'zeromq')
    optdepeneds=('tor')
    backup=('etc/peercoin/peercoin.conf')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            share/examples/peercoin.conf \
            "$pkgdir/etc/peercoin/peercoin.conf"
    install -D --mode 644 \
            contrib/peercoind.bash-completion \
            "$pkgdir/usr/share/bash-completion/completions/peercoind"
    install -D --mode 644 \
            contrib/systemd/peercoind@.service \
            "$pkgdir/usr/lib/systemd/system/peercoind@.service"
    install -D --mode 644 \
            contrib/systemd/peercoind-tor@.service \
            "$pkgdir/usr/lib/systemd/system/peercoind-tor@.service"
    install -D --mode 644 \
            contrib/debian/manpages/peercoin.conf.5 \
            "$pkgdir/usr/share/man/man5/peercoin.conf.5"
    install -D --mode 644 \
            doc/man/peercoind.1 \
            "$pkgdir/usr/share/man/man1/peercoind.1"
    install -D --mode 755 \
            src/peercoind \
            "$pkgdir/usr/bin/peercoind"
}

package_peercoin-qt() {
    pkgdesc="A peer-to-peer network-based digital currency - Qt"
    depends=('boost-libs' 'db' 'libevent' 'miniupnpc' 'openssl' 'qrencode' 'qt5-base' 'zeromq')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/debian/peercoin-qt.desktop \
            "$pkgdir/usr/share/applications/peercoin-qt.desktop"
    install -D --mode 644 \
            doc/man/peercoin-qt.1 \
            "$pkgdir/usr/share/man/man1/peercoin-qt.1"
    install -D --mode 644 \
            share/pixmaps/peercoin128.png \
            "$pkgdir/usr/share/pixmaps/peercoin128.png"
    install -D --mode 755 \
            src/qt/peercoin-qt \
            "$pkgdir/usr/bin/peercoin-qt"
}

package_peercoin-tx() {
    pkgdesc="A peer-to-peer network-based digital currency - transaction tool"
    depends=('boost-libs')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/peercoin-tx.bash-completion \
            "$pkgdir/usr/share/bash-completion/completions/peercoin-tx"
    install -D --mode 644 \
            doc/man/peercoin-tx.1 \
            "$pkgdir/usr/share/man/man1/peercoin-tx.1"
    install -D --mode 755 \
            src/peercoin-tx \
            "$pkgdir/usr/bin/peercoin-tx"
}
