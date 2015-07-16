# Contributor: Guillaume DOLLÉ <dolle.guillaume at gmail.com>
# Maintainer: George Eleftheriou <eleftg>

pkgbase='feelpp'
pkgname='feelpp'
true && pkgname=( 'feelpp' 'feelpp-examples' )
pkgver=0.99.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/feelpp"
license=('LGPL')
depends=('ann'
         'cln'
         'arpack'
         'boost-libs'
         'libxml2'
         'gmsh'
         'mumps'
         'petsc' )
makedepends=('cmake>=2.8.7')
optdepends=( 'eigen3'
             'fftw'
             'metis'
             'suitesparse'
             'slepc'
             'openturns'
             'hdf5-openmpi'
             'hdf5'
             'gperftools' )

source=($url/$pkgname/releases/download/v$pkgver-final.1/$pkgname-$pkgver-final.1.tar.gz)

prepare() {
    mkdir -p build
}

build() {
    cd build
    ../$pkgbase-$pkgver-final.1/configure -r --prefix=/usr
}

package_feelpp() {
    pkgdesc="Feel++ a library for finite element methods - libraries"
    cd $srcdir/build/contrib/ginac
    make DESTDIR="$pkgdir/" install
    cd $srcdir/build/feel/
    make DESTDIR="$pkgdir/" install
    cd $srcdir/build/cmake/modules
    make DESTDIR="$pkgdir/" install
    install -D -m 0644 $srcdir/$pkgbase-$pkgver-final.1/COPYING.md $pkgdir/usr/share/licenses/${pkgbase//pp}/COPYING.md
    install -D -m 0644 $srcdir/$pkgbase-$pkgver-final.1/ChangeLog  $pkgdir/usr/share/doc/${pkgbase//pp}/ChangeLog
    install -D -m 0644 $srcdir/$pkgbase-$pkgver-final.1/README.md  $pkgdir/usr/share/doc/${pkgbase//pp}/README.md
}

package_feelpp-examples() {
    pkgdesc="Feel++ a library for finite element methods - examples"
    cd $srcdir/build/doc/manual/tutorial
    make DESTDIR="$pkgdir/" install
}

md5sums=('47d49dde8af39a03c89fc0f64953db67')
