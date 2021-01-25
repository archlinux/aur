# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=16.0.100
pkgrel=3
pkgdesc="Desktop client for FAU's file synchronization service"
arch=('any')
url="https://www.fau.eu/intranet/tools/faubox-cloud-storage-for-all-fau-members/"
license=(custom)
depends=('java-runtime=15')
makedepends=('gendesk')


source=("faubox.sh"
        "https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha512sums=('4f1036a62b55a61afd456c101f965aec05373eb7a2765c918673cbb2824a88d3d0265a7f9e1052ddb6dc657cb3634dfa02c6e03a1aa26968e88103465b3dc024'
            '93c11e23dfcbcae9c245dfca628d4bedc89fc71dec13076f465eb108f6019189a85d697486bb71f95d3325864ca3e8e7725d473d73c422e5dd2b323da7bc935f')


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
