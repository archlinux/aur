pkgname=gimp-webp-bzr
pkgver=0
pkgrel=1
pkgdesc='A WebP plugin for Gimp. Allowing to export/import to this format.'
arch=('i686' 'x86_64')
url='https://launchpad.net/gimp-webp'
license=('GNU GPL3')
depends=('gimp' 'libwebp')
makedepends=('bzr')
provides=('gimp-webp')
conflicts=('gimp-webp')

_bzrroot="https://code.launchpad.net/~george-edison55/gimp-webp/trunk"
_bzrname="gimp-webp"

build() {
	cd "$srcdir"
	msg "Connecting to BZR server...."
	
	if [ -d $_bzrname ] ; then
		cd $_bzrname && bzr update
		msg "The local files are updated."
	else
		bzr checkout $_bzrroot $_bzrname
	fi
	
	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	cd "$srcdir/$_bzrname"
	
	make
}

package(){
	cd "$srcdir/$_bzrname"

	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
