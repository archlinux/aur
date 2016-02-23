# Maintainer: Micah Chambers <micahc.vt@gmail.com>

pkgname=caffe
pkgver=rc3
pkgrel=1
pkgdesc="Neural network toolkit"
arch=('i686' 'x86_64')
url="https://github.com/BVLC/caffe"
license=('BSD')
groups=('base-devel')
depends=('atlas-lapack-base' 'hdf5' 'opencv' 'boost' 'protobuf' 'google-glog'
		 'gflags' 'leveldb' 'snappy' 'lmdb')
makedepends=('git' 'cmake')
optdepends=('cuda: for GPU support')
source=("https://github.com/BVLC/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0884207bfba0fbc8b263b87d30f9304f7094eec3a48f975177d142f8c72b6e3b')

build() {
    if [ $CARCH = "i686" ]; then
        lib="lib"
    else
        lib="lib64"
    fi

    cd "$srcdir/$pkgname-$pkgver"
    rm -fr build
    mkdir build
    cd build
    cmake ../   -DAtlas_LAPACK_LIBRARY=/usr/${lib}/libatlas.so \
                -DAtlas_BLAS_LIBRARY=/usr/${lib}/libatlas.so \
                -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/

    make
}

package() {
        cd "$srcdir/$pkgname-$pkgver/build"
        make install
}
