# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=screencast
pkgname=screencast-git
pkgver=1.0.0.r0.g4e6a153
pkgrel=1
pkgdesc="Command line interface to record a X11 desktop (Git version)"
arch=('i686' 'x86_64')
url="https://github.com/bermond/screencast/"
license=('GPL2')
depends=('ffmpeg')
optdepends=('bc: fade effect support'
            'imagemagick: watermark effect support'
            'libnotify: desktop notification support'
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
