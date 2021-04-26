# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=16.1.100
pkgrel=1
pkgdesc="Desktop client for FAU's file synchronization service"
arch=('any')
url="https://www.intern.fau.de/personal-und-arbeitsleben/arbeitsmittel-und-instrumente/faubox-cloudspeicher-fuer-alle-fau-angehoerigen"
license=(custom)
depends=('java-runtime=15')
makedepends=('gendesk')


source=("faubox.sh"
        "https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha512sums=('4f1036a62b55a61afd456c101f965aec05373eb7a2765c918673cbb2824a88d3d0265a7f9e1052ddb6dc657cb3634dfa02c6e03a1aa26968e88103465b3dc024'
            '8bdac833e59160e28f7f2d8ba363417ebc0a8550e23360fd6af3bf7fc1ba775154a83d7fe9693bd21cae519079a3a8752a6f2cfac72d0af78beb86e2b3b92e77')


prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "FAU file synchronization service" --name "FAUbox" --categories "Network"
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
