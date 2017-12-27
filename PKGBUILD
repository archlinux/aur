# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=screencast-git
pkgver=1.4.0.r176.g23a3872
pkgrel=1
pkgdesc='Command line interface to record a X11 desktop (git version)'
arch=('any')
url='https://github.com/dbermond/screencast/'
license=('GPL')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify' 'oxygen-icons')
makedepends=('git')
optdepends=('bc: fade effect support'
            'imagemagick: watermark effect support'
            'slop: graphical screen region selection support'
            'sound-theme-freedesktop: sound notification support'
            'optipng: watermark optimization support'
            'oxipng: watermark optimization support'
            'littleutils-full: watermark optimization support'
            'truepng: watermark optimization support'
            'pingo: watermark optimization support'
            'advancecomp: watermark optimization support'
            'bash-completion: bash-completion support')
provides=('screencast')
conflicts=('screencast')
source=("$pkgname"::'git+https://github.com/bermond/screencast.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
