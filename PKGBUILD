# Maintainer: Tadeusz Magura-Witkowski <tadeuszmw gmail>

pkgname=droidstar-git
pkgver=r37.a24658b
pkgrel=1
pkgdesc="This software connects to M17, Fusion (YSF/FCS, DN and VW modes are supported), DMR, P25, NXDN, D-STAR (REF/XRF/DCS) reflectors and AllStar nodes (as an IAX2 client) over UDP."
arch=('i686' 'x86_64')
url="https://github.com/nostar/DroidStar"
license=('GPL2 GPL3')
depends=('qt5-quickcontrols2' 'qt5-multimedia' 'qt5-serialport' 'qt5-declarative' 'qt5-base' 'qt5-quickcontrols' 'make' 'pulseaudio' 'libvorbis' 'dina-font')
makedepends=('gcc' 'git' 'libimbe_vocoder')
conflicts=('droidstar')
provides=('droidstar')
source=("$pkgname"::'git+https://github.com/nostar/DroidStar'
	'droidstar.desktop'
	'droidstar.png')
sha1sums=('SKIP'
	'150a499f54a723a923171990f8a56a9a253cf053'
	'62ab00e1d2c24e1baefdda6eacd504ceb8df5dca')

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
    install -Dm644 "droidstar.desktop" "$pkgdir/usr/share/applications/droidstar.desktop"
    install -Dm644 "droidstar.png" "$pkgdir/usr/share/pixmaps/droidstar.png"
    cd "$srcdir/$pkgname"
    qmake -install qinstall -exe DroidStar ${pkgdir}/usr/bin/droidstar
}
