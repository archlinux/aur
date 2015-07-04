# Maintainer: Marcelo Garlet Millani <marcelogmillani at gmail dot com>
pkgname=boomange
pkgver=0.1.3.1
pkgrel=2
pkgdesc='A Bookmarks manager with a HTML generator'
url="http://hackage.haskell.org/package/${pkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
# DYNAMIC LINKAGE
#depends=('haskell-simtreelo' 'haskell-descrilo' 'ghc' 'gmp' 'libffi')
###
# STATIC LINKAGE
depends=('gmp' 'libffi')
makedepends=('haskell-simtreelo' 'haskell-descrilo' 'ghc')
###
source=( "http://hackage.haskell.org/package/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz" )
sha256sums=('a0e249f91c62048a2cbf1d2935deab37ff214099634c15bb308a41fa72a3e1e9')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# DYNAMIC LINKAGE
	#runhaskell Setup configure --prefix=/usr -O --enable-executable-dynamic
	# STATIC LINKAGE
	runhaskell Setup configure --prefix=/usr -O --disable-executable-dynamic
	runhaskell Setup build
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	runhaskell Setup copy --destdir=${pkgdir}
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	mkdir -p ${pkgdir}/usr/share/man/man1
	install -D -m 0644 boomange.1 ${pkgdir}/usr/share/man/man1/
	gzip ${pkgdir}/usr/share/man/man1/boomange.1
	rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

