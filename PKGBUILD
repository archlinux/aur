# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=22.0.100
pkgrel=1
pkgdesc="FAU file synchronization client"
arch=('any')
url="https://www.doku.faubox.rrze.fau.eu/"
license=(custom)
depends=('java-runtime>=11')
makedepends=('gendesk')


source=("faubox.sh"
        "FAUbox_Linux_${pkgver}.tar.gz::https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha512sums=('37ecb657cc1ef6eedb24c0b47038ee5124417a4e5e8c8a159108980b29ac7b553e946cb7d4fda3492f785fede08e217dfeab40b02a57ef3c31da565980580437'
            'ebcb32cf993e8e33adfca0ee87fface28b896d0548c702aa826a66c282904077ea697354830da3c23bb149bbfcfa7bea71d105e3b026988840b9fb4b51230ad4')


prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "FAUbox" \
            --categories "Network;FileTransfer"
}

package() {
    cd $srcdir
    install -Dm655 faubox.sh $pkgdir/usr/bin/faubox
    install -Dm644 faubox.desktop $pkgdir/usr/share/applications/faubox.desktop

    cd $srcdir/FAUbox
    install -Dm644 FAUbox.jar $pkgdir/usr/share/java/$pkgname/FAUbox.jar
    install -Dm644 install-files/FAUbox.png $pkgdir/usr/share/pixmaps/faubox.png
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
