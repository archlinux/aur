# Packaged by hal clark --> gmail.com@hdeanclark

pkgname=plastimatch-static
pkgver=1.6.2
pkgrel=1
pkgdesc='Tools for medical image reconstruction and registration.'
arch=('i686' 'x86_64')
url='http://plastimatch.org/'
license=('BSD')
conflicts=('plastimatch')
depends=('insight-toolkit' 'dcmtk' 'libpng' 'zlib' 'libtiff' 'libjpeg-turbo' 'fftw' 'nlopt')
makedepends=('cmake')
optdepends=('cuda')

source=("http://forge.abcd.harvard.edu/gf/download/frsrelease/214/3443/plastimatch-${pkgver}-Source.tar.bz2")
md5sums=('e2767664856b0ebfa4302528b94f3773')
sha1sums=('38b7c11e24cb3bbeceab966f625ae0337c7fd725')

build() {
    cd "${srcdir}"
    rm -rf build
    mkdir build
    cd build

    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DBUILD_TESTING:BOOL=off \
      -DBUILD_SHARED_LIBS:BOOL=off \
      ../plastimatch-${pkgver}-Source/

    make
}

package() {
    cd "${srcdir}"/build/
    make DESTDIR="${pkgdir}" install
}

