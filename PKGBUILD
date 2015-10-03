# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink
_dvver=10.5a17 # DesktopVideo
_mever=3.4.1a2 # MediaExpress
pkgver=${_dvver}
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/products/"
license=('custom')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt4')
options=('!strip' 'staticlibs')
install='decklink.install'
source=("file://Blackmagic_Desktop_Video_Linux_${pkgver%a*}.tar.gz")
sha256sums=('493ef15a1106b5459c64bbdc6fcbd30007c6c5432bbc7be1c05ffcd5f45ef233')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

package() {
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	cd "$srcdir/Blackmagic_Desktop_Video_Linux_${pkgver%a*}/other/${_arch}"

	tar xf "desktopvideo-${_dvver}-${_arch}.tar.gz"
	cp -a "desktopvideo-${_dvver}-${_arch}/"* "$pkgdir"
	mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
	rm -rf "$pkgdir/usr/sbin"

	tar xf "mediaexpress-${_mever}-${_arch}.tar.gz"
	cp -a "mediaexpress-${_mever}-${_arch}/"* "$pkgdir"
}
