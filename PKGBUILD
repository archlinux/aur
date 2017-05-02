# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=heasoft
pkgver=6.21
pkgrel=2
pkgdesc="NASA high energy astrophysics library"
makedepends=("gcc" "glibc" "gcc-fortran" "perl")
depends=("ncurses" "libtinfo" "readline" "libxpm" )
optdepends=("lynx")
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=(http://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/release/${pkgname}-${pkgver}src_no_xspec_modeldata.tar.gz ${pkgname}-${pkgver}_nolynx.patch)
sha1sums=('3c55645feae3ddffc86d6c1b3c1b989e8a7d5d1b'
	'c1d4940d1aa599bf3b8b61b3471ebf057869b517')

prepare() {
  # lynx conflict with ncurses and openssl. For now left it out.
  # lynx can be installed from official repo.
  cd $srcdir/${pkgname}-${pkgver}
  patch -Np1 -i ../${pkgname}-${pkgver}_nolynx.patch 
}


build() {

  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export FC=/usr/bin/gfortran
  export PERL=/usr/bin/perl

  cd $srcdir/${pkgname}-${pkgver}/BUILD_DIR
  ./configure --prefix=${pkgdir}/opt/${pkgname}-${pkgver}
  
  make 

}

package(){

  cd $srcdir/${pkgname}-${pkgdir}/BUILD_DIR
  make install

}

