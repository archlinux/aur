# Maintainer: Aitor Pazos <mail at aitorpazos dot es> 
pkgname='freicoin-qt'
pkgver=0.8.6.1
pkgrel=1
pkgdesc="Freicoin distributed currency (based on bitcoin). Desktop application."
arch=('i686' 'x86_64')
url="http://freico.in/"
license=('MIT')
depends=('boost-libs' 'openssl' 'miniupnpc' 'mpfr')
makedepends=( 'git' 'make' 'gcc' 'boost' 'qt4' 'qrencode')
provides=( 'freicoin' )

source=("https://github.com/freicoin/freicoin/archive/v${pkgver}.tar.gz"
		freicoin-qt.install)
		
md5sums=('74515a30be9794a0d17ffa2ecdee0f24'
		'bb69bd2ae94b5545709f4009faebbc8e')

build() {
	#Freicoin-qt
	cd "$srcdir/freicoin-${pkgver}/"
	export QT_SELECT=4
	qmake USE_DBUS=1 USE_QRCODE=1 USE_IPV6=1 USE_UPNP=1
	make
}

package_freicoin-qt() {
pkgdesc="Freicoin distributed currency (based on bitcoin). Desktop application."
depends=('qt4' 'qrencode' )
  install -D -m755 ${srcdir}/freicoin-${pkgver}/freicoin-qt ${pkgdir}/usr/bin/freicoin-qt
  install -d -m644 ${srcdir}/freicoin-${pkgver}/share/pixmaps ${pkgdir}/usr/share/pixmaps/freicoin-qt
  install -D -m644 ${srcdir}/freicoin-${pkgver}/share/pixmaps/* ${pkgdir}/usr/share/pixmaps/freicoin-qt/
  install -D -m644 ${srcdir}/freicoin-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  install -D -m644 ${srcdir}/freicoin-${pkgver}/contrib/debian/freicoin-qt.desktop ${pkgdir}/usr/share/applications/freicoin-qt.desktop
  cd ${pkgdir}/usr/share/pixmaps/
  ln -s freicoin-qt/freicoin80.xpm freicoin80.xpm
}
