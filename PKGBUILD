# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=pastix
pkgver=5.2.3
pkgrel=1
pkgdesc="high performance parallel solver for very large sparse linear systems based on direct methods"
arch=('i686' 'x86_64')
url="https://gforge.inria.fr"
license=('CeCILL-C')
depends=('python2' 'openmpi' 'blas' 'scotch')
makedepends=('gcc-fortran')
#optdepends=('metis' 'parmetis')
source=("${url}/frs/download.php/latestfile/218/pastix_5.2.3.tar.bz2")
md5sums=('31a1c3ea708ff2dc73280e4b85a82ca8')

build() {
    cd ${pkgname}_${pkgver}
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    cmake ../src -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd ${pkgname}_${pkgver}/build

    make install DESTDIR="${pkgdir}"

    mkdir "${pkgdir}/usr/share" "${pkgdir}/usr/share/pastix"
    mv  "${pkgdir}/usr/examples" "${pkgdir}/usr/share/pastix/"
    mv  "${pkgdir}/usr/matrix" "${pkgdir}/usr/share/pastix/"
}
