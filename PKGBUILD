# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=linrad
pkgver=04.14a
pkgrel=1
pkgdesc="Software defined radio receiver for x11"
arch=('x86_64')
url="http://www.sm5bsz.com/linuxdsp/linrad.htm"
license=('custom')
depends=('portaudio' 'libxext' 'libusb-compat')
makedepends=('nasm' 'autoconf')
provides=('linrad')
# Check the developer website for the latest version
source=(http://www.sm5bsz.com/linuxdsp/archive/lir${pkgver/./-}.tbz
              $pkgname.png
              $pkgname.desktop)
sha512sums=('1a26635be30a51b4ffd02e3d21e118f717a2cc267929c4ff9214d76690fe7af54885b1d2fb4846a139a283c66e904445ebfbd1fed7116ebd0ad9beeaec956f99'
            '463d107e1732a35c53d23da32af93e1c18fa2e04d7977a1649ee06ac6a8ea5c11191102e51d124afc033ee038e63fdca2756e42de72b56b567b6b47a7b4e350f'
            '16431308bfb2f1b168fd5730bc0b6992702fa71047482330e0e73b6fb725c0f24c0be7f982c3c0c7de45f3ca5a110ebc93242d4ca89e5e4634c7235a6a855135')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./clean
    autoreconf
    ./configure --prefix=${pkgdir} --datadir=/usr/share/${pkgname}
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make xlinrad64
}

package(){
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    cp -a $srcdir/$pkgname-$pkgver/*.txt $pkgdir/usr/share/doc/$pkgname
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -a $srcdir/$pkgname-$pkgver/*.lir $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/bin
    cp -a $srcdir/$pkgname-$pkgver/xlinrad64 $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/share/applications
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

# vim:set ts=2 sw=2 et:
