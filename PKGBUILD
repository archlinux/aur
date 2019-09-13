# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libclipper
pkgver=2.1.20180802
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
_pkgname=clipper
pkgrel=3
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('libccp4>=6.5.1-6' 'mmdb2>=2.0.19-1' 'fftw2-float' 'libssm')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$_pkgname-$pkgver.tar.gz
	clipper-configure-2.patch)

sha256sums=('7c7774f224b59458e0faa104d209da906c129523fa737e81eb3b99ec772b81e0'
            '3cf0a68163451773e9764c11c740fcbd1a91daf9d5782d94049b90f3cd1fe5ae')

prepare() {
    cd "$srcdir/$_pkgname-2.1"
    patch --forward --strip=0 --input="${srcdir}/clipper-configure-2.patch"
}

build() {
  cd "$srcdir/$_pkgname-2.1"

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
  cd "$srcdir/$_pkgname-2.1"

  make DESTDIR="$pkgdir/" install
}
