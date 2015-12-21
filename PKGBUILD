# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=img2xterm
pkgver=1.0.0
pkgrel=1
pkgdesc="Displays images on your 256-color terminal with Unicode block characters"
arch=(any)
url="https://github.com/rossy/img2xterm"
license=('CC0')
depends=('imagemagick' 'ncurses')
optdepends=('gimp: palette containing the upper 240 colours used in xterm')
options=(!emptydirs)
install=
source=("https://github.com/rossy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('426c682ce61d047f9cf3c3334907dc023475974a5644792591316c137010066e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    cd "$srcdir/$pkgname-$pkgver/extra"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

