# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>
# Contributor/original package maintainer: doragasu <doragasu AT hotmail DOT com>

pkgname=saugns
pkgver=0.5.5b
pkgrel=1
pkgdesc="Curses-based SAU parser, player, WAV file writer and signal generator - stable branch"
arch=('i686' 'x86_64' 'aarch64')
url="https://sau.frama.io/#saugns"
license=('LGPL-3.0-or-later')
depends=('ncurses' 'alsa-lib')
conflicts=('saugns')
provides=('saugns')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/sau/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1e08bdc843859dccdb4d9dbda6672a601b058a3901f4e1ba7a478772540b99e4')


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

