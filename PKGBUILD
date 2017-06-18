# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=screencast
pkgname=screencast-git
pkgver=1.2.0.r0.gf747466
pkgrel=3
pkgdesc="Command line interface to record a X11 desktop (git version)"
arch=('any')
url="https://github.com/dbermond/screencast/"
license=('GPL')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify')
optdepends=('bc: fade effect support'
            'imagemagick: watermark effect support'
            'oxygen-icons: desktop notification icons support'
            'sound-theme-freedesktop: sound notification support'
            'advancecomp: png (watermark) optimization support'
            'truepng: png (watermark) optimization support'
            'pingo: png (watermark) optimization support'
            'optipng: png (watermark) optimization support'
            'littleutils-full: png (watermark) optimization support')
provides=('screencast')
conflicts=('screencast')
source=("$pkgname"::"git+https://github.com/bermond/screencast.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Git, tags available
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
	cd "${srcdir}/${pkgname}"
	gzip -9f "$_srcname".1
	install -D -m755 "$_srcname"      "${pkgdir}/usr/bin/${_srcname}"
	install -D -m644 "$_srcname".1.gz "${pkgdir}/usr/share/man/man1/${_srcname}.1.gz"
}
