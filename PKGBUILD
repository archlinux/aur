# Maintainer: Marcelo Garlet Millani <marcelogmillani at gmail dot com>
pkgname=boomange
pkgver=0.1.3.6
pkgrel=1
pkgdesc='A Bookmarks manager with a HTML generator'
url="http://hackage.haskell.org/package/${pkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('haskell-simtreelo' 'haskell-descrilo' 'ghc-libs' 'gmp' 'libffi')
makedepends=('ghc')
source=( "http://hackage.haskell.org/package/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz" )
sha256sums=('c11d70c7391edb9707d07491c7fc00aacf07a392e0ccfff2eef0fbc564dfb03d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	runhaskell Setup configure --prefix=/usr -O --enable-executable-dynamic
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
