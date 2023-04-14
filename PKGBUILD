pkgname=qtltools
pkgver=1.3.1
pkgrel=2
pkgdesc="A complete tool set for molecular QTL discovery and analysis. https://doi.org/10.1038/ncomms15452"
arch=('i686' 'x86_64')
url="https://qtltools.github.io/qtltools"
license=('GPL3')
depends=('boost' 'bzip2' 'gzip' 'zip' 'gsl' 'cblas' 'openblas' 'htslib' 'r')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qtltools/qtltools/archive/refs/tags/${pkgver}.tar.gz" 
        'Makefile.patch')

sha256sums=('033b9b61923fd65c4b8b80bc0add321e6fd6fb40de49d15c2dfe6a4d7e60764a'
            '5bdfda40c5f793f25840172b55fd3caffba53c2ef71c94d3f0ff12a607643763')

prepare() {
    # patch Makefile as 'make PREFIX=/usr' does not work
    cp Makefile.patch ${pkgname}-${pkgver}/
    cd ${pkgname}-${pkgver}
    patch -p1 < Makefile.patch
  
}

build() {
    cd ${pkgname}-${pkgver}
    make

}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}/"
}
