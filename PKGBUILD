# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=burstcoin-wallet
pkgver=1.3.6cg
pkgrel=1
pkgdesc="The world's first HDD-mined cryptocurrency using an energy efficient and fair Proof-of-Capacity (PoC) consensus algorithm."
arch=('i686' 'x86_64')
url="https://github.com/PoC-Consortium/burstcoin"
license=('MIT')
backup=(opt/burstcoin-wallet/conf/{logging-default.properties,nxt-default.properties})
depends=('java-runtime-common' 'java-runtime>=8')
source=(https://github.com/PoC-Consortium/burstcoin/releases/download/${pkgver}/burstcoin-${pkgver}.zip
burstcoin-wallet.service
)
md5sums=('1141371b2e3d08a4ca33f2483202351a'
         'ffc739247043a0b48b51278666fb095a')

package() {
    install -dm755 $pkgdir/usr/lib/systemd/system
    install -dm755 $pkgdir/opt/$pkgname

    cp -dr --no-preserve=ownership $srcdir/{burst_db,conf,html,lib,burst.jar,Burst_Wallet.url,genscoop.cl,MIT-license.txt} $pkgdir/opt/$pkgname

    install -Dm755 burst.sh $pkgdir/opt/$pkgname

    sed -i -e 's/nxt.dbUrl.*/nxt.dbUrl=jdbc:h2:\/opt\/burstcoin-wallet\/burst_db\/burst;DB_CLOSE_ON_EXIT=FALSE/g' $pkgdir/opt/$pkgname/conf/nxt-default.properties

    install -Dm644 burstcoin-wallet.service $pkgdir/usr/lib/systemd/system/burstcoin-wallet.service
}
