# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgname=bandage
pkgver=0.8.1
pkgrel=1
pkgdesc="Bioinformatics Application for Navigating De novo Assembly Graphs Easily"
arch=('x86_64')
url="https://github.com/rrwick/Bandage"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')
source=("bandage-$pkgver.tar.gz::https://github.com/rrwick/Bandage/archive/v${pkgver}.tar.gz"
        "bandage.desktop")
sha256sums=('f160b695e03f0b254ffdccfa35b45dc8a733e8161d9928441edb8b63c8e44452'
            '0996828261389a3e060918d5d1f04f5901cf1ec210333251871d06f9e575d0e9')

build() {
    cd "$srcdir/Bandage-$pkgver"
    # QT5 is the current version in Arch, but I'll leave this here so we don't
    # forget how to change the version when 6 comes out.
    export QT_SELECT=5
    qmake Bandage.pro
    make
}

package() {
    cd "$srcdir/Bandage-$pkgver"
    install -Dm755 Bandage "$pkgdir/usr/bin/Bandage"
    install -Dm644 "$srcdir/bandage.desktop" "$pkgdir/usr/share/applications/bandage.desktop"
    install -Dm644 images/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/bandage.png"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
