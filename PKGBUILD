# Maintainer: anon at sansorgan.es
_hkgname=arbtt
pkgname=arbtt
pkgver=0.10.2
pkgrel=3
pkgdesc="Automatic Rule-Based Time Tracker"
url="http://hackage.haskell.org/package/arbtt"
license=('GPL2')
arch=('i686' 'x86_64')
provides=('haskell-arbtt')
conflicts=('haskell-arbtt')
depends=('ghc'
'haskell-aeson<=1.5'
'haskell-aeson>=0.1'
'haskell-bytestring-progress'
'haskell-conduit'
'haskell-pcre-light'
'haskell-strict'
'haskell-terminal-progress-bar<0.5.0'
'haskell-terminal-progress-bar>=0.4.0'
'haskell-terminal-size'
'haskell-utf8-string'
'haskell-x11'
) 
makedepends=('ghc'
		'haskell-aeson>=0.1'
		'haskell-aeson<1.5'
		'haskell-base<5'
		'haskell-base>=4.7'
		'haskell-binary>=0.5'
		'haskell-bytestring'
		'haskell-bytestring-progress'
		'haskell-conduit'
		'haskell-containers>=0.5'
		'haskell-containers<0.75'
		'haskell-deepseq'
		'haskell-directory'
		'haskell-exceptions>0.8'
		'haskell-filepath'
		'haskell-mtl'
		'haskell-parsec>=3.0'
		'haskell-parsec<4.0'
		'haskell-pcre-light'
		'haskell-resourcet>=1.2'
		'haskell-strict'
		'haskell-time'
		'haskell-terminal-progress-bar>=0.4.0'
		'haskell-terminal-progress-bar<0.5.0'
		'haskell-text'
		'haskell-transformers'
		'haskell-utf8-string'
		'haskell-unliftio-core'
		'haskell-unix'
		'haskell-x11'
)
options=('strip')
source=(https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)


build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
	
	runhaskell Setup build
	runhaskell Setup register --gen-script
	runhaskell Setup unregister --gen-script
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
	runhaskell Setup copy --destdir="${pkgdir}"
	install -Dm 644 arbtt-capture.desktop  "${pkgdir}/usr/share/applications/arbtt-capture.desktop"
	install -Dm 644 categorize.cfg "${pkgdir}/usr/share/${pkgname}/categorize.cfg"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/arbtt"
}
md5sums=('1b2fe0992719512d8e7b0c47ec0cc16c')
