# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=cmanager
pkgver=0.2.44
pkgrel=1
pkgdesc='Sync logs between geocaching.com and opencaching.de'
arch=('any')
url='https://github.com/RoffelKartoffel/cmanager'
license=('GPL3')
depends=('java-runtime>=8')
_jarname="$pkgname-$pkgver.jar"
source=("$_jarname::https://github.com/RoffelKartoffel/$pkgname/releases/download/$pkgver/cm-$pkgver.jar"
        "cmanager.sh"
        "cmanager.desktop")
md5sums=('452f9790ed1dca18721045a24fab9ab3'
         'c258a1a5adc27de5a84572563d7578e6'
         '48e41659e9c12c300672135072581e52')
noextract=("$_jarname")

prepare() {
    bsdtar -xf "$_jarname" --strip-components 2 ressources/images/logo.jpg
}

package() {
    # application
    install -Dm644 "$_jarname" "$pkgdir/usr/share/java/cmanager/cmanager.jar"
    install -Dm755 cmanager.sh "$pkgdir/usr/bin/cmanager"

    # desktop integration
    install -Dm644 cmanager.desktop "$pkgdir/usr/share/applications/cmanager.desktop"
    install -Dm644 logo.jpg "$pkgdir/usr/share/pixmaps/cmanager.jpg"
}
