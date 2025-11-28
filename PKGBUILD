# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Ivan Wu <2967948168 at qq dot com>

_hkgname=adblock2privoxy
pkgname=$_hkgname
pkgver=2.3.1
pkgrel=1
pkgdesc="Convert adblock config files to privoxy format"
arch=('x86_64')
url="https://github.com/essandess/adblock2privoxy"
license=('GPL')
depends=('ghc-libs' 'haskell-case-insensitive' 'haskell-http-conduit' 'haskell-missingh' 'haskell-network' 'haskell-network-uri' 'haskell-parsec-permutation' 'haskell-old-locale' 'haskell-strict')
makedepends=('ghc')
options=('!emptydirs')
source=("https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8a6113404ad8254da885c8f0f7cb837f136d5ef4baf9d8b25ee14e6c0a47d0be')

build() {
    cd $srcdir/$_hkgname-$pkgver
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
}

package() {
    cd $srcdir/$_hkgname-$pkgver
    runhaskell Setup copy --destdir="$pkgdir"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
