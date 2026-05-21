# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=saugns
pkgver=0.5.7b
pkgrel=1
pkgdesc="Curses-based SAU parser, player, WAV file writer and signal generator"
arch=('i686' 'x86_64' 'aarch64')
url="https://sau.frama.io/#saugns"
license=('LGPL-3.0-or-later')
depends=('ncurses' 'alsa-lib')
conflicts=('saugns')
provides=('saugns')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/sau/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6f9117e0d1b31f57f3c4e68e3dc0f921c08d553157e6a35cea15aad96e5b034c')


build() {
    cd "$srcdir/${pkgname}"
    make
    make DESTDIR="$srcdir" install
}

package() {
    install -d -m755 $pkgdir/usr
    install -d -m755 $pkgdir/usr/bin
    install -d -m755 $pkgdir/usr/share
    install -d -m755 $pkgdir/usr/share/man
    install -d -m755 $pkgdir/usr/share/man/man1    
    install -d -m755 $pkgdir/usr/share/doc

    cp -r $srcdir/usr/local/bin/saugns $pkgdir/usr/bin/
    cp -r $srcdir/usr/local/share/man/man1/* $pkgdir/usr/share/man/man1
    cp -r $srcdir/usr/local/share/doc/$pkgname $pkgdir/usr/share/doc
    cp -r $srcdir/usr/local/share/$pkgname $pkgdir/usr/share
}

