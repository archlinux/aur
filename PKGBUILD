pkgname=fahviewer
pkgver=7.4.4
pkgrel=1
pkgdesc="A Folding@home 3D simulation viewer"
url="http://folding.stanford.edu/English/HomePage"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glew' 'gtk2' 'freetype2' 'glut')
options=('!docs' '!libtool')

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

[ "$CARCH" = "i686" ] &&_source_arch="32bit"
[ "$CARCH" = "x86_64" ] && _source_arch="64bit"

if [ "$CARCH" = "i686" ]; then
    
source=(https://fah-web.stanford.edu/file-releases/public/release/fahviewer/debian-testing-32bit/v7.4/fahviewer_7.4.4-32bit-release.tar.bz2)
    md5sums=('cf42a73256d149ecbbe0a25041c18347')
     
elif [ "$CARCH" = "x86_64" ]; then
    
source=(https://fah-web.stanford.edu/file-releases/public/release/fahviewer/debian-testing-64bit/v7.4/fahviewer_7.4.4-64bit-release.tar.bz2)
    md5sums=('f006aa42227fcd292e8ca342e8fb238d')
fi

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf fahviewer_${pkgver}-${_source_arch}-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-${_source_arch}-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


