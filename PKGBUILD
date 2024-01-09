# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=cernlib
pkgver=2023.10.31.0
pkgrel=1
pkgdesc="A large collection of CERN libraries and tools for high energy physics, e.g. PAW and GEANT 3.21."
arch=('x86_64' 'i686')
url="https://cernlib.web.cern.ch/index.html"
license=('GPL3')
depends=('cmake' 'make' 'openssl' 'lapack' 'blas' 'gcc' 'libnsl' 'gcc-fortran' 'openmotif' 'git' 'freetype2' 'gawk' 'libxau' 'libxaw' 'freetype2' 'bc' 'findutils' 'xbae')
optdepends=()
source=("https://cernlib.web.cern.ch/cernlib/download/2023_source/tar/cernlib-${pkgver}.tar.gz"
        )
noextract=()
md5sums=('b12d7b68971f0ecbd4b3f9aecf728b99')

build() {
        cd "$srcdir/cernlib-$pkgver"
        
        mkdir -p build
        cd build
        cmake -S ../ -B ./ -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build ./
}

package() {
        cd "$srcdir/cernlib-$pkgver"
        cd build
	DESTDIR="$pkgdir/" cmake --install . --prefix=/usr
        rm $pkgdir/usr/include/cfortran.h  ## TODO: conflicts with ROOT
}
