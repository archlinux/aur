# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=pastix
pkgver=5.2.2.22
pkgrel=3
pkgdesc="high performance parallel solver for very large sparse linear systems based on direct methods"
arch=('i686' 'x86_64')
url="https://gforge.inria.fr"
license=('CeCILL-C')
depends=('python2' 'openmpi' 'blas' 'scotch')
makedepends=('gcc-fortran')
#optdepends=('metis' 'parmetis')
source=("${url}/frs/download.php/file/35070/pastix_5.2.2.22.tar.bz2"
        'Makefile.patch'
        'config.in')
md5sums=('85127ecdfaeed39e850c996b78573d94'
         '001fd8641a333134e73c81e0abc2be27'
         'a9577e2c2b27247828420455be029a19')

prepare() {
   patch -p1 < Makefile.patch
}

build() {
    _build_dir=${srcdir}/${pkgname}_${pkgver}/src
    cd ${_build_dir}
    cp ${startdir}/config.in config.in
    sed -i "s#PKG_DIR#${pkgdir}#" config.in
    make
}

package() {
    _build_dir=${srcdir}/${pkgname}_${pkgver}/src    
    cd ${_build_dir}
    make install
}
