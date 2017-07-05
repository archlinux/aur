# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=screencast
pkgname=screencast-git
pkgver=1.4.0.r0.g2fc33ee
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
            'truepng: watermark optimization support'
            'pingo: watermark optimization support'
            'optipng: watermark optimization support'
            'littleutils-full: watermark optimization support'
            'advancecomp: watermark optimization support')
provides=('screencast')
conflicts=('screencast')
source=("$pkgname"::'git+https://github.com/bermond/screencast.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "$pkgname"
    gzip -9f "${_srcname}.1"
    install -D -m755 "$_srcname"        "${pkgdir}/usr/bin/${_srcname}"
    install -D -m644 "${_srcname}.1.gz" "${pkgdir}/usr/share/man/man1/${_srcname}.1.gz"
}
