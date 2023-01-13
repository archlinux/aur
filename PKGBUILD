# Maintainer: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>
# Contributor: solopasha <daron439 at gmail dot com>

pkgname=prepros-bin
pkgver=7.7.0
pkgrel=1
pkgdesc="Compile Sass, Less, Jade and much more with live browser refresh."
arch=('x86_64')
url="https://prepros.io"
source=("https://downloads.prepros.io/v7/${pkgver}/Prepros-${pkgver}.deb"
        "prepros.sh")
license=('custom:proprietary')
options=('!strip')
sha512sums=('8870c63baa36256394933f2f3e6018f7633a92dc9f2b3a92530a91b923b177bac12329d733cdb7e4f9980858e8f2e9564477d7888a82b6a6655450ad7288406a'
            'b0785ac40fd28671df558cdb10daa3758ff5ba052e8da381c0aa9c7340ba82719f7c9679433e393ea8921060eccaa17797764fcbf262258adc23ab78acc2c840')

prepare() {
        mkdir _fakeinstall
        tar xf data.tar.zst -C _fakeinstall
}

package() {
        depends=(electron)
        install -Dm755 prepros.sh "${pkgdir}/usr/bin/prepros"
        install -Dm644 _fakeinstall/usr/share/doc/prepros/copyright "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
        install -Dm644 _fakeinstall/usr/share/applications/prepros.desktop -t "${pkgdir}/usr/share/applications"
        install -Dm644 _fakeinstall/usr/share/pixmaps/prepros.png -t "${pkgdir}/usr/share/pixmaps"
        cd _fakeinstall/usr/lib/prepros/resources
        find . -type d -exec install -d {,"$pkgdir"/usr/lib/${pkgname%-bin}/}{} \;
        find . -type f -exec install -D {,"$pkgdir"/usr/lib/${pkgname%-bin}/}{} \;
}
