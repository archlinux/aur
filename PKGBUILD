# Original: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=mrbayes
_up_pkgname=MrBayes
pkgver=3.2.7
pkgrel=1
pkgdesc="A program for the Bayesian estimation of phylogeny"
arch=('i686' 'x86_64')
license=('GPL')
url="http://nbisweden.github.io/MrBayes/"
depends=('readline')
optdepends=('beagle-lib: for using GPU calculations among other enhancements - rebuild package after installing this dep')
source=(https://github.com/NBISweden/MrBayes/archive/v${pkgver}.tar.gz)
sha256sums=('64da39c01f606d0413ce90a1dd3c1ce2cbdef4cbad99aee8a4b2391a2e8db244')

build() {
  cd ${srcdir}/${_up_pkgname}-${pkgver}
  #Build with beagle-lib support if available:
  if [ -f /usr/lib/libhmsbeagle.so ]
  then
    msg "beagle-lib found! Building with CUDA support."
    ./configure --with-beagle=/usr --prefix=${pkgdir}/usr
  else
    msg "beagle-lib not found! Building without CUDA support."
    ./configure --with-beagle=no --prefix=${pkgdir}/usr
  fi
  make
}
package() {
  cd ${srcdir}/${_up_pkgname}-${pkgver}
  make install
}
