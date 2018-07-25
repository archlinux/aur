# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=burstcoin-wallet
pkgver=2.2.1
pkgrel=2
pkgdesc="The world's first HDD-mined cryptocurrency using an energy efficient and fair Proof-of-Capacity (PoC) consensus algorithm."
arch=('i686' 'x86_64')
url="https://github.com/PoC-Consortium/burstcoin"
license=('GPL3')
options=('!strip')
backup=(opt/burstcoin-wallet/conf/{logging-default.properties,brs-default.properties})
depends=('java-runtime-common' 'java-runtime>=8' 'xdg-utils')
optdepends=('mariadb: for storage')
install=burstcoin-wallet.install
source=(https://github.com/PoC-Consortium/burstcoin/releases/download/${pkgver}/burstcoin-${pkgver}.zip
burstcoin-wallet.service
burstcoin-wallet.desktop
)
sha256sums=('6bb82c125db2757bf7a92512907785c02a8312d910a85ca4e0600b3860a21bc1'
            '677aa600c97fcba5ec20f3e442f02acd920602e6bf08a8e536088fd6e2d15585'
            '44b494c86b4f8d7eeba365e83586e129543ceb67bc92a7b19df00918a8505865')

package() {
    cd $srcdir

    # Lib directory
    install -d $pkgdir/opt/$pkgname
    cp -a burst_db conf html burst.jar genscoop.cl init-mysql.sql "$pkgdir/opt/$pkgname"
    install -Dm755 burst.sh -t "$pkgdir/opt/$pkgname"

    # Daemon
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Menu entry
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "html/ui/img/burst_logo_collapsed.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
