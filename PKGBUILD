# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=burstcoin-wallet
pkgver=2.5.1
pkgrel=1
pkgdesc="The world's first HDD-mined cryptocurrency using an energy efficient and fair Proof-of-Capacity (PoC) consensus algorithm"
arch=(x86_64)
url='https://github.com/burst-apps-team/burstcoin'
license=(GPL3)
options=(!strip !emptydirs)
backup=(opt/burstcoin-wallet/conf/{logging-default.properties,brs-default.properties})
depends=(java-environment xdg-utils)
optdepends=('mariadb: for storage')
install=burstcoin-wallet.install
source=(https://github.com/burst-apps-team/burstcoin/releases/download/v${pkgver}/burstcoin-${pkgver}.zip
        burstcoin-wallet.service
        burstcoin-wallet.desktop)
sha256sums=('ef914cced6a707958f5512ac997058820f3d50ad9e2b12fed3656379b529eea5'
            'c58fb9b5d7aea20f64ee5a15b5999dde626fd6d96d5771a0ca32879b6e9e7bd8'
            '648f64707713ec4dc6dbcb000d85a0bae43a2960667c029ad220155221718039')

package() {
    cd $srcdir

    # Lib directory
    install -d $pkgdir/opt/$pkgname
    cp -a conf html burst.jar $pkgdir/opt/$pkgname
    mkdir $pkgdir/opt/$pkgname/burst_db

    # Daemon
    install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service

    # Menu entry
    install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications
    install -Dm644 html/ui/img/burst_logo_collapsed.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
