# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=qdecoder
pkgver=12.0.6
pkgrel=1
pkgdesc="qDecoder is a CGI library for C/C++ programming language which has been developed since 1996."
arch=('x86_64' 'i686')
url="https://wolkykim.github.io/qdecoder/"
license=('CUSTOM')
depends=()
makedepends=('fcgi')
source=("https://github.com/wolkykim/qdecoder/archive/r${pkgver}.tar.gz"
        #Patch provided by amish corrects destdir
        "Makefile.patch")
sha256sums=('e2aaec44b3469baa32b7659c804c7d71da5fbfb0eefa456dbd45ebaf77675a80'
            '6cc0f82417c46e80dd87b3fb3621dbc0ed7ce85c8cc6bba856cb18f6cb2e376f')


prepare() {
    cd "${srcdir}/${pkgname}-r${pkgver}"
    patch -p1 < ../Makefile.patch
    ./configure --enable-fastcgi=/usr/include --prefix="${pkgdir}/usr"
}

build() {
    cd "${srcdir}/${pkgname}-r${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-r${pkgver}"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}" "$pkgdir/usr/include" "$pkgdir/usr/lib"
    make install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
