# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=16.6.100
pkgrel=1
pkgdesc="FAU file synchronization client"
arch=('any')
url="https://www.intern.fau.de/personal-und-arbeitsleben/arbeitsmittel-und-instrumente/faubox-cloudspeicher-fuer-alle-fau-angehoerigen"
license=(custom)
depends=('java-runtime=11')
makedepends=('gendesk')


source=("faubox.sh"
        "https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha512sums=('8983893a7d470544633c0815a0f097f5c0ac2ceadf52a37e6fd308118692e228a455e084382d67c641385349eb25e5936502bc9322a88a29aa1c221ea5e18c90'
            '1621500deb6b2851fc9764126eb4afd0ef1a04f40777731f927b5c7ada3a03f325894fba78a02da7bf3c881b48e5979e2ffe9716f37af7401ef02e533ac69ac5')


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
