# Maintainer: Yannik Enss <me@adnidor.de>
pkgname=red_lenlab
pkgver=7.5.2
pkgrel=1
pkgdesc="Lenlab ist eine Oszilloskop-Software für das TI LaunchPad EK-TM4C123GXL."
arch=("x86_64")
url="https://github.com/kalanzun/red_lenlab"
license=('GPL3')
depends=(libusb qt5-base qt5-charts)
source=("https://github.com/kalanzun/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "20-lenlab.rules")
md5sums=('2b9394c4137d5ec18e69688c9c37788a'
         '1966217f850fd434a9699327cdfe8572')

build() {
    cd "$pkgname-$pkgver"
    qmake red_lenlab.pro
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -D "lenlab/app/lenlab" "$pkgdir/usr/bin/lenlab"
    cd ..
    install -D "20-lenlab.rules" "$pkgdir/etc/udev/rules.d/20-lenlab.rules"
}
