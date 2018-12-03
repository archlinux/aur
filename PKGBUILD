# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: lily wilson <hotaru@thinkindifferent.net>

pkgname=libemf
pkgver=1.0.9
pkgrel=3
pkgdesc='Library implementation of ECMA-234 API for the generation of enhanced metafiles'
arch=('i686' 'x86_64')
url='http://libemf.sourceforge.net/'
license=('GPL' 'LGPL')
depends=('gcc-libs')
source=("https://sourceforge.net/projects/libemf/files/libemf/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dcc1f7dc09597a7e20fa808fbef03f0c5cbdd99d65a4fddd981d7f1dd6e28b81')

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-threads \
        --enable-editing
        
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    
    # the test 'docheck2' may randonly fail when using multiple jobs
    # https://sourceforge.net/p/libemf/bugs/4/
    make -j1 check
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
