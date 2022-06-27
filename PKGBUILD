# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>


# Note: this software is difficult to install.

pkgname=mummer
pkgver=4.0.0rc1
pkgrel=2
pkgdesc="MUMmer is a program for rapidly aligning large genomes"
arch=('i686' 'x86_64')
url="http://mummer.sourceforge.net"
license=('PerlArtistic')
depends=('perl' 'gnuplot')
makedepends=('autoconf' 'yaggo') #'python' 'ruby' 'swig'
replaces=(mummer64)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mummer4/mummer/archive/refs/tags/v4.0.0rc1.tar.gz")

build() {
  cd ${pkgname}-${pkgver}
  autoupdate -f
  autoreconf -fi 
  export CXXFLAGS="-Wno-error"
  ./configure --prefix=/usr/ --program-prefix=${pkgname}- \
    --libexecdir=/usr/lib/ 
#   --enable-all-binding
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/include/${pkgname}-${pkgver}/include/* ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/include/${pkgname}-${pkgver}
}
sha512sums=('c22c7efbb0374b9b41b3f8788a0360e0bc11cd0a7eda4c88907ebcc75e8a51240fc338d33dd7d6800f2d550b359d13bfa79b187379be774e28c73864c6904c26')
