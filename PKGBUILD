# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=plink
pkgver=1.07
pkgrel=2
pkgdesc="Whole genome association analysis toolset"
arch=('i686' 'x86_64')
license=('GPL')
url="http://zzz.bwh.harvard.edu/plink/download.shtml"
depends=('r' 'zlib' 'lapack')
source=(http://zzz.bwh.harvard.edu/plink/dist/${pkgname}-${pkgver}-src.zip
        current_gcc.patch)
md5sums=('4566376791df4e69459b849bd7078fa3'
         '407ef451ca255ff201bffbba37d0a4e2')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  sed -i 's/WITH_LAPACK = /&1/g' Makefile
  sed -i 's/CXXFLAGS = //' Makefile
  sed -i 's/FORCE_DYNAMIC = /&1/' Makefile
  patch -p1 < ../current_gcc.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}-src
    install -d ${pkgdir}/usr/bin
    install -D -m 755 plink ${pkgdir}/usr/bin/plink
}
