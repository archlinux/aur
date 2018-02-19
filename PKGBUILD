# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=img2xterm
pkgver=1.0.0
pkgrel=3
pkgdesc="Displays images on your 256-color terminal with Unicode block characters"
arch=(any)
url="https://github.com/rossy/img2xterm"
license=('CC0')
makedepends=('help2man')
depends=('imagemagick' 'ncurses')
optdepends=('gimp: palette containing the upper 240 colours used in xterm')
options=(!emptydirs)
install=
source=("https://github.com/rossy/$pkgname/archive/v$pkgver.tar.gz"
        "imagemagick7.patch")
sha256sums=('426c682ce61d047f9cf3c3334907dc023475974a5644792591316c137010066e'
            'a71a8cf2618396c1c88b60311c45db1c09ed263a74197c2be0fc338a3969a932')

prepare() {
   cd "$srcdir/$pkgname-$pkgver"
   patch -Np1 -i "${srcdir}/imagemagick7.patch"
}

build() {
    # build img2xterm
    cd "$srcdir/$pkgname-$pkgver"
    make
    # build the GIMP palette
    cd "$srcdir/$pkgname-$pkgver/extra"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    #install -D -m644 xterm-256color.gpl "${pkgdir}/usr/share/${pkgname}/"
}

