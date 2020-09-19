# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=screencast-git
pkgver=1.6.0.r0.gec79d20
pkgrel=1
pkgdesc='Command line interface to record a X11 desktop (git version)'
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
makedepends=('git')
checkdepends=('xorg-server-xvfb' 'imagemagick' 'ttf-dejavu')
provides=('screencast')
conflicts=('screencast')
source=('git+https://github.com/bermond/screencast.git')
sha256sums=('SKIP')

pkgver() {
    git -C screencast describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    make -C screencast
}

check() {
    xvfb-run -n 71 --server-args='-screen 0 1280x720x24' \
        make -C screencast USEDISPLAY=':71.0' AUDIOIN='none' test
}

package() {
    make -C screencast PREFIX='/usr' DESTDIR="$pkgdir" install
}
