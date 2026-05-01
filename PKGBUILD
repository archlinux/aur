# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

# Note: this software is difficult to install.

pkgname=mummer
pkgver=4.0.1
pkgrel=1
pkgdesc="MUMmer is a program for rapidly aligning large genomes"
arch=('i686' 'x86_64')
url="http://mummer.sourceforge.net"
license=('PerlArtistic')
depends=('perl' 'gnuplot')
makedepends=('autoconf' 'yaggo') #'python' 'ruby' 'swig'
replaces=(mummer64)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mummer4/mummer/archive/refs/tags/v${pkgver}.tar.gz")

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
sha512sums=('5f21569bfcb9f41e04723ffe13957b65df9c4f02472f5b86184f25a29392058cbba0531d197f8ea8bb9946572826a94114851b439fb237ee562de9c1ba7afe88')
