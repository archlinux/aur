# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=burstcoin-wallet
pkgver=2.4.1
pkgrel=1
pkgdesc="The world's first HDD-mined cryptocurrency using an energy efficient and fair Proof-of-Capacity (PoC) consensus algorithm."
arch=('i686' 'x86_64')
url="https://github.com/burst-apps-team/burstcoin"
license=('GPL3')
options=('!strip' '!emptydirs')
backup=(opt/burstcoin-wallet/conf/{logging-default.properties,brs-default.properties})
depends=('java-environment' 'xdg-utils')
optdepends=('mariadb: for storage')
install=burstcoin-wallet.install
source=(https://github.com/burst-apps-team/burstcoin/releases/download/v${pkgver}/burstcoin-${pkgver}.zip
burstcoin-wallet.service
burstcoin-wallet.desktop
)
sha256sums=('fc3d943ddd34c6e3fefed5de824f2ebe72ba6947fb9d287ef95875f56ea775a2'
            'ffb9c5431f65485b2c08b4ca6c2b68b3c2001961b22ed4a66c528ed26bcb2dae'
            '44b494c86b4f8d7eeba365e83586e129543ceb67bc92a7b19df00918a8505865')

package() {
    cd $srcdir

    # Lib directory
    install -d $pkgdir/opt/$pkgname
    cp -a conf html burst.jar genscoop.cl init-mysql.sql "$pkgdir/opt/$pkgname"
    install -Dm755 burst.sh -t "$pkgdir/opt/$pkgname"

    # Daemon
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Menu entry
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "html/ui/img/burst_logo_collapsed.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
