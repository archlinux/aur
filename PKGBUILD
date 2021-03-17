# Maintainer: Christoph Freysoldt <freysoldt at mpie dot de>
# Maintainer: Oliver Marquardt <marquardt at wias-berlin dot de>
pkgname=sphinxdft
pkgver=2.7
pkgrel=1
pkgdesc="S/PHI/nX electronic structure code for density-functional theory and k dot p"
arch=('x86_64')
url="https://sxrepo.mpie.de"
license=('Apache-2.0')
depends=('lapacke' 'cblas' 'netcdf')
makedepends=('gcc' 'gcc-objc' 'gcc-libs' 'make' 'pcre2' 'lapack' 'fftw' 'cblas' 'netcdf' 'blas' 'hdf5' 'patchelf' 'lapacke')
grous=()
provides=('sphinx')
conflicts=()
replaces=()
backup=()
options=()
source=("sphinx-$pkgver.tar.xz")
pkgext=("sphinx-$pkgver.tar.xz")
sha1sums=('72bc1be167d78a93f9973ecd147251b76c392b31')

prep() {
./setup
}

build() {
        cd "$srcdir/sphinx-$pkgver"
        ./configure --disable-static --enable-shared --enable-netlib --enable-fftw --disable-debug --enable-openmp --enable-numlibschecks DIST_OS=Linux CXX_M_ARCH=-march=x86-64 TARGET_ARCH=x86_64
       
}
package() {
        cd "$srcdir/sphinx-$pkgver"
        make DESTDIR="$pkgdir/" install
        mkdir -p ${pkgdir}/usr/bin
        ln -s "/usr/src/packages/BUILD/sphinxdft/src/sphinx-$pkgver/bin/sphinx" $pkgdir/usr/bin/sphinx

} 
