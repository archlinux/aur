# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=faubox
pkgver=14.11.100
pkgrel=2
pkgdesc="Desktop client for FAU's file synchronization service"
arch=('any')
url="https://www.fau.eu/intranet/tools/faubox-cloud-storage-for-all-fau-members/"
license=(custom)
depends=('jre8-openjdk')
makedepends=('gendesk')


source=(faubox
        https://faubox.rrze.uni-erlangen.de/client_deployment/FAUbox_Linux.tar.gz)
sha256sums=(710a2e2b98411b1cb47c5723de3d5b925328c83f362fd4f80e1bad6717dda0b9
            9a04b17bacb17a72a5101033a9006d93a2b21a63c87319d0a00ac333c916acd4)


prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "FAU file synchronization" --name "FAUbox" --categories "Network"
}

package() {
    cd ${srcdir}
    install -Dm655 faubox ${pkgdir}/usr/bin/faubox
    install -Dm644 faubox.desktop ${pkgdir}/usr/share/applications/faubox.desktop
    
    cd ${srcdir}/FAUbox
    install -Dm644 FAUbox.jar ${pkgdir}/usr/share/java/${pkgname}/FAUbox.jar
    install -Dm644 VERSION ${pkgdir}/usr/share/${pkgname}/VERSION
    install -Dm644 README ${pkgdir}/usr/share/${pkgname}/README
    install -Dm644 install-files/FAUbox.png ${pkgdir}/usr/share/pixmaps/faubox.png
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
