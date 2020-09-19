# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=screencast
pkgver=1.6.0
pkgrel=1
pkgdesc='Command line interface to record a X11 desktop'
arch=('any')
url='https://github.com/dbermond/screencast/'
license=('GPL')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify' 'oxygen-icons')
optdepends=('imagemagick: watermark effect support'
            'slop: graphical screen region selection support'
            'sound-theme-freedesktop: sound notification support'
            'optipng: watermark optimization support'
            'oxipng: watermark optimization support'
            'littleutils-full: watermark optimization support'
            'truepng: watermark optimization support'
            'pingo: watermark optimization support'
            'advancecomp: watermark optimization support'
            'bash-completion: bash-completion support')
checkdepends=('xorg-server-xvfb' 'imagemagick' 'ttf-dejavu')
source=("https://github.com/dbermond/screencast/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/dbermond/screencast/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('10a283372bf76753bdcbdc60661e0efe48bc579c3191f7c3495e14d65ad527e3'
            'SKIP')
validpgpkeys=('3FFA6AB7B69AAE6CCA263DDE019A7474297D8577') # Daniel Bermond

build() {
    make -C "${pkgname}-${pkgver}"
}

check() {
    xvfb-run -n 71 --server-args='-screen 0 1280x720x24' \
        make -C "${pkgname}-${pkgver}" USEDISPLAY=':71.0' AUDIOIN='none' test
}

package() {
    make -C "${pkgname}-${pkgver}" PREFIX='/usr' DESTDIR="$pkgdir" install
}
