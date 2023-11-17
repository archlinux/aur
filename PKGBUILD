# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=bayescan
_up_pkgname=BayeScan
pkgver=2.1
pkgrel=2
pkgdesc="Detecting natural selection from population-based genetic data"
arch=('i686' 'x86_64')
url="http://cmpg.unibe.ch/software/BayeScan/index.html"
license=('GPL3')
depends=('gcc-libs')
source=("https://github.com/mfoll/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c37ba4d9f66b0cb5509a1c41d8f09a017cb81107ee8528e1b367126163fe2702')

prepare() {
  #Remove static link
  cd ${srcdir}/${_up_pkgname}-${pkgver}
  sed -i 's/-static//' Makefile
  # Change variable name
  #sed -i 's/b,beta,delta/b,my_beta,delta/g' *.cpp
  #sed -i 's/+beta/+my_beta/g' *.cpp
  #sed -i 's/-beta\[j\]/-my_beta[j]/g' *.cpp
  #sed -i 's/ beta\[j\]/ my_beta[j]/g' *.cpp
  #sed -i 's/=beta\[j\]/=my_beta[j]/g' *.cpp
  #sed -i 's/ beta=new/ my_beta=new/g' *.cpp
  #sed -i 's/ beta =/ my_beta =/g' *.cpp
  #sed -i 's/a+1.0\/beta/a+1.0\/my_beta/g' *.cpp
  #sed -i 's/beta\*log/my_beta*log/g' *.cpp
  #sed -i 's/a\*beta-/a*my_beta-/g' *.cpp
  #sed -i 's/GLOB double *beta/GLOB double *my_beta/g' *.cpp
  sed -i 's/beta/my_beta/g' *.{cpp,h}
}

build() {
  cd ${srcdir}/${_up_pkgname}-${pkgver}
  make
}

package() {
  install -D $srcdir/${_up_pkgname}-${pkgver}/${pkgname}_${pkgver} $pkgdir/usr/bin/${pkgname}
}
