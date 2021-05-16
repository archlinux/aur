# Maintainer: Shawn Cresante

pkgname=dudestar-git
pkgver=r185.b5e239e
pkgrel=1
pkgdesc="Software to RX/TX D-STAR, DMR, Fusion YSF/FCS, NXDN, P25, M17, and IAX (AllStar client) over UDP"
arch=('x86_64')
url="https://github.com/nostar/dudestar"
license=('GPL')
depends=('qt5-multimedia' 'qt5-serialport' 'qt5-base' 'make' 'pulseaudio' 'libvorbis')
makedepends=('gcc' 'git')
conflicts=('dudestar')
provides=('dudestar')

source=("$pkgname"::'git+https://github.com/nostar/dudestar')
sha1sums=('SKIP')

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
    cd "$srcdir/$pkgname"
    qmake -install qinstall -exe dudestar ${pkgdir}/usr/bin/dudestar
}
