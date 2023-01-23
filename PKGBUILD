# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=18.1.100
pkgrel=1
pkgdesc="FAU file synchronization client"
arch=('any')
url="https://www.doku.faubox.rrze.fau.eu/"
license=(custom)
depends=('java-runtime=11')
makedepends=('gendesk')


source=("faubox.sh"
        "FAUbox_Linux_${pkgver}.tar.gz::https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha512sums=('2197dcb189f2897d8a19727494e7e506576341cc4247c20a05e393bb4205eab3c93ce32a062a36593c7f344ef59ec5d5680196d72de3c8a9ecdcb002d1bd0e0f'
            'ce2086870e93cd79af642088aad45e7e78c9c953fe55d39e8eb53db3c2ab2c9b533617ce8d835d33a68b0deb909df4d08dd2481892a2b183b772ec7e546bfb9b')


prepare() {
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "FAUbox" \
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
