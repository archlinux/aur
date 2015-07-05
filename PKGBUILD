pkgname=oacapture
_realname=oaCapture
pkgver=0.5.0
pkgrel=1
pkgdesc="oaCapture is a planetary imaging application in Qt4"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt4')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("http://www.openastroproject.org/wp-content/uploads/2015/05/oaCapture-0.5.0.tar.bz2" "configure.patch")
sha1sums=('07bfbceae008fae97814689a97ead0f7246d8b52' 'bd8f1e136c33a444e92abea2ef8fb74fff7b9008')

build() {
	cd "${_realname}-${pkgver}"
	patch -Np1 < ${srcdir}/configure.patch
	autoreconf --force --install
	./configure --prefix=/usr
	make
}

package() {
	cd "${_realname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# removing FFMPEG install, it's already linked in static
	rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/lib
}

