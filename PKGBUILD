# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=clipper
pkgver=2.1.20150701
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
pkgrel=2
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('libccp4' 'mmdb2' 'fftw2-float' 'libssm')
source=(ftp://ftp.ccp4.ac.uk/opensource/$pkgname-$pkgver.tar.gz
        ${_url}/clipper_test_contrib.cpp.patch
        clipper_pkgconfig.patch)

sha256sums=('d8f4436088ed72f274e3ae5077f826853704b18315875c6d86a414236a9caea1'
            'cc93c20bedeb890f95b780649a42ce14bb8e43fb75156d7580531c98ce5e550e'
            '1c010889d5f84a051a7044044fc2c3e34ed411b40e6b188031e500a5721aa7e2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/clipper_test_contrib.cpp.patch"

  ./configure --prefix=/usr \
              --enable-shared \
              --disable-static \
              --enable-contrib \
              --enable-ccp4 \
              --enable-cif \
              --enable-mmdb \
              --enable-minimol \
              --enable-cns \
              --enable-phs \
              --enable-fortran
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
} 
