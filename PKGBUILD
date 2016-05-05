# Maintainer: mickele
pkgname=tfel
pkgver=2.0.3
pkgrel=1
pkgdesc="TFEL/MFront introduces DSLs based on C++ to handle material knowledge"
arch=('i686' 'x86_64')
url="http://tfel.sourceforge.net/"
license=('gpl')
depends=()
provides=('mfront')
makedepends=('cmake')
optdepends=()
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2" "cmake-3.5.patch")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -Np1 -i "${srcdir}/cmake-3.5.patch"
}

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   mkdir -p build
   cd build

   cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -Denable-fortran=ON -Denable-aster=ON .. 

   make
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}/build"
   
   make DESTDIR=${pkgdir} install
}

md5sums=('7c0a2fd1ad2c721682a2cdf267aff145'
         'e4ade3562af07f05f0575162d119b8d9')
