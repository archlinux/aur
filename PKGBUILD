# Maintainer: Shawn Cresante

pkgname=dudestar-git
pkgver=r185.b5e239e
pkgrel=3
pkgdesc="Software to RX/TX D-STAR, DMR, Fusion YSF/FCS, NXDN, P25, M17, and IAX (AllStar client) over UDP"
arch=('x86_64')
url="https://github.com/nostar/dudestar"
license=('GPL2 GPL3')
depends=('qt5-multimedia' 'qt5-serialport' 'qt5-base' 'make' 'pulseaudio' 'libvorbis' 'dina-font')
makedepends=('gcc' 'git')
conflicts=('dudestar')
provides=('dudestar')

source=("$pkgname"::'git+https://github.com/nostar/dudestar'
        "dudestar.desktop"
        "dudestar.xpm")
sha1sums=('SKIP'
          '59dfd153d06cdfe3e37f10573a5c29c877c1ba77'
          'c478985cdc69bfe0c2f9ca4d6b09ab59a83fdd75')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    qmake
    make
}

package() {
    install -Dm644 dudestar.desktop "$pkgdir/usr/share/applications/dudestar.desktop"
    install -Dm644 dudestar.xpm "$pkgdir/usr/share/pixmaps/dudestar.xpm"
    cd "$srcdir/$pkgname"
    qmake -install qinstall -exe dudestar ${pkgdir}/usr/bin/dudestar
}
