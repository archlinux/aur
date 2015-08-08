# Maintainer: Aitor Pazos <mail at aitorpazos dot es> 
pkgname='freicoind'
pkgver=0.8.6.1
pkgrel=1
pkgdesc="Freicoin distributed currency(based on bitcoin). Daemon."
arch=('i686' 'x86_64')
url="http://freico.in/"
license=('MIT')
depends=('boost-libs' 'openssl' 'miniupnpc' 'mpfr' 'gmp')
makedepends=( 'git' 'make' 'gcc' 'boost' 'qt4' 'qrencode')
provides=( 'freicoin' )

source=("https://github.com/freicoin/freicoin/archive/v${pkgver}.tar.gz"
		freicoind.install
		freicoind.service
		freicoind.tmpfiles)

md5sums=('74515a30be9794a0d17ffa2ecdee0f24'
		'7cefc39669993339c02f65288f412eae'
		'8d10dfee4a07cc141a2a8f5ec222fa9c'
        '71c6d6e842e7b1f318ea156cf970b58d')


build() {
	#Freicoind
	cd "$srcdir/freicoin-${pkgver}/src/"
	export QT_SELECT=4
	make -f makefile.unix
}

package_freicoind() {
pkgdesc="Freicoin distributed currency(based on bitcoin). Daemon."
install=freicoind.install
backup=(etc/freicoind.conf)
  install -D -m755 ${srcdir}/freicoin-${pkgver}/src/freicoind ${pkgdir}/usr/bin/freicoind
  install -D -m644 ${srcdir}/freicoin-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  install -D -m644 ${srcdir}/freicoin-${pkgver}/contrib/debian/examples/freicoin.conf ${pkgdir}/etc/freicoind.conf
  install -D -m644 ${srcdir}/freicoin-${pkgver}/contrib/debian/manpages/freicoin.conf.5 ${pkgdir}/usr/share/man/en/man5/freicoin.conf.5
  gzip ${pkgdir}/usr/share/man/en/man5/freicoin.conf.5
  install -D -m644 ${srcdir}/freicoin-${pkgver}/contrib/debian/manpages/freicoind.1 ${pkgdir}/usr/share/man/en/man1/freicoind.1
  gzip ${pkgdir}/usr/share/man/en/man1/freicoind.1
  install -D -m644 freicoind.service ${pkgdir}/usr/lib/systemd/system/freicoind.service
}
