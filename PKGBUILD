# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=16.0.100
pkgrel=1
pkgdesc="Desktop client for FAU's file synchronization service"
arch=('any')
url="https://www.fau.eu/intranet/tools/faubox-cloud-storage-for-all-fau-members/"
license=(custom)
depends=('java-runtime>=14')
makedepends=('gendesk')


source=("faubox.sh"
        "https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha256sums=('6b63d8d69c8f4e1cc000cab99cd22de26e390530353941ee7544e0ea74ae3f1a'
            'b3808fd8911c96183619e1023759aee76b5e0f5e79dbb7136288ba89afff3b0a')


prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "FAU file synchronization" --name "FAUbox" --categories "Network"
}

package() {
    cd $srcdir
    install -Dm655 faubox.sh $pkgdir/usr/bin/faubox
    install -Dm644 faubox.desktop $pkgdir/usr/share/applications/faubox.desktop

    cd $srcdir/FAUbox
    install -Dm644 FAUbox.jar $pkgdir/usr/share/java/$pkgname/FAUbox.jar
    install -Dm644 VERSION $pkgdir/usr/share/$pkgname/VERSION
    install -Dm644 install-files/FAUbox.png $pkgdir/usr/share/pixmaps/faubox.png
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
