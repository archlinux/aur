# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=clipper
pkgver=2.1.20140911
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
pkgrel=1
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('ccp4-libs' 'mmdb2' 'fftw2-float' 'ssmlib')
source=(ftp://ftp.ccp4.ac.uk/opensource/$pkgname-$pkgver.tar.gz
        ${_url}/clipper_test_contrib.cpp.patch
        clipper_pkgconfig.patch)

sha256sums=('ced2b2f3a9480805bd111f454742a7152b21212d9749fd5e8fb11e40ecbcd9cf'
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
