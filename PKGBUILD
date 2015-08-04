# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=polygnome
pkgver=0.1.3
pkgrel=1
pkgdesc="A polyrhythmic metronome"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/polygnome/"
license=('GPL3')
depends=('stk' 'jack')
source=("http://sourceforge.net/projects/polygnome/files/polygnome-0.1.3.tar.gz"
		"mtaudio.patch")
md5sums=('2367b483d1b8f351482e03eebf8b4c3d'
         'b2d1be46214d51f2e56e909338247a71')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
# add missing header
	patch -Np1 -i ../mtaudio.patch
# configure doesn't add '-ljack' properly
	JACK_LIBS="$(pkg-config jack --libs)" ./configure  --prefix=/usr
	make 
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
