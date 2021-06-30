# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=16.1.100
pkgrel=3
pkgdesc="FAU file synchronization client"
arch=('any')
url="https://www.intern.fau.de/personal-und-arbeitsleben/arbeitsmittel-und-instrumente/faubox-cloudspeicher-fuer-alle-fau-angehoerigen"
license=(custom)
depends=('java-runtime=11')
makedepends=('gendesk')


source=("faubox.sh"
        "https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz")
sha512sums=('8983893a7d470544633c0815a0f097f5c0ac2ceadf52a37e6fd308118692e228a455e084382d67c641385349eb25e5936502bc9322a88a29aa1c221ea5e18c90'
            '8bdac833e59160e28f7f2d8ba363417ebc0a8550e23360fd6af3bf7fc1ba775154a83d7fe9693bd21cae519079a3a8752a6f2cfac72d0af78beb86e2b3b92e77')


prepare() {
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "FAUbox" --categories "Network"
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
