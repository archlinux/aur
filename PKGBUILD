# Original: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=mrbayes
pkgver=3.2.5
pkgrel=1
pkgdesc="A program for the Bayesian estimation of phylogeny"
arch=('i686' 'x86_64')
license=('GPL')
url="http://mrbayes.csit.fsu.edu"
depends=('readline')
optdepends=('beagle-lib: for using GPU calculations among other enhancements - rebuild package after installing this dep')
source=(http://downloads.sourceforge.net/mrbayes/${pkgname}-${pkgver}.tar.gz)
md5sums=('a85a63e5382bc7ea36b1ce1c2138ee6e')

build() {
  cd ${srcdir}/src
  autoconf
  #Build with beagle-lib support if available:
  if [ -f /usr/lib/libhmsbeagle.so ]
  then
    msg "beagle-lib found! Building with CUDA support."
    ./configure --with-beagle=/usr
  else
    msg "beagle-lib not found! Building without CUDA support."
    ./configure --with-beagle=no
  fi
  make
}
package() {
  install -D -m755 ${srcdir}/src/mb ${pkgdir}/usr/bin/mb
}
