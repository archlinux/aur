# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=cernlib
pkgver=2022.11.08.0
pkgrel=2
pkgdesc="A large collection of CERN libraries and tools for high energy physics, e.g. PAW and GEANT 3.21."
arch=('x86_64' 'i686')
url="https://cernlib.web.cern.ch/index.html"
license=('GPL3')
depends=('cmake' 'make' 'openssl' 'lapack' 'blas' 'gcc' 'libnsl' 'gcc-fortran' 'openmotif' 'git' 'freetype2' 'gawk' 'libxau' 'libxaw' 'freetype2' 'bc' 'findutils' 'xbae')
optdepends=('')
source=("https://cernlib.web.cern.ch/cernlib/download/2022_source/tar/cernlib-${pkgver}.tar.gz"
        )
noextract=()
md5sums=('4c169e770280bf4162bc74f4cf284250')

build() {
        cd "$srcdir/cernlib-cernlib-$pkgver"
        
        mkdir -p build
        cd build
        cmake -S ../ -B ./ -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build ./
}

package() {
        cd "$srcdir/cernlib-cernlib-$pkgver"
        cd build
	DESTDIR="$pkgdir/" cmake --install . --prefix=/usr
        rm $pkgdir/usr/include/cfortran.h  ## TODO: conflicts with ROOT
}
