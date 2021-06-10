# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=xerox-phaser-3020
pkgver=1.00.25
pkgrel=1
pkgdesc="Driver for the Xerox Phaser 3020. Also supports Phaser 3052, 3117, 3140, 3155, 3160, 3200MFP, 3250, 3260, 3300MFP, 3320, 3435, 3600, 6110MFP, WorkCentre 3025, 3210, 3215, 3220, 3225, 3315, 3325, 3550, 4118, PE120, PE220, FaxCentre 2218"
url="https://www.support.xerox.com/support/phaser-3020"
license=('custom')
arch=('x86_64' 'i686' 'armv7h')
depends=('libusb-compat' 'cups' 'ghostscript')
source=("https://download.support.xerox.com/pub/drivers/3020/drivers/linux/en_GB/Xerox_Phaser_3020_Linux-Driver.tar.gz")
sha256sums=('a7a77b4609576a6ab0ff5a55ff36cab72759e59fb1b82226b0c0187deecdd5b4')

package() {
    archdir="$CARCH"
    if [ "$CARCH" == "i686" ]; then
        archdir="i386"
    elif [ "$CARCH" == "armv7h" ]; then
        archdir="arm"
    fi

    mkdir -p "$pkgdir"/usr/lib
    cp "$srcdir"/uld/$archdir/libscmssc.so "$pkgdir"/usr/lib

    mkdir -p "$pkgdir"/usr/lib/cups/backend
    cp "$srcdir"/uld/$archdir/smfpnetdiscovery "$pkgdir"/usr/lib/cups/backend

    mkdir -p "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$archdir/pstosecps   "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$archdir/rastertospl "$pkgdir"/usr/lib/cups/filter

    mkdir -p "$pkgdir"/usr/share/ppd/xerox
    cp -ar "$srcdir"/uld/noarch/share/ppd/. "$pkgdir"/usr/share/ppd/xerox
    rm "$pkgdir"/usr/share/ppd/xerox/*_fr.ppd
}
