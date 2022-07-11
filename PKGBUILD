# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=tabixpp
_pkgver=1.1.1
pkgver=1.1.1
pkgrel=4
pkgdesc="C++ wrapper to tabix indexer"
arch=('x86_64')
url="https://github.com/ekg/tabixpp"
license=('MIT')
depends=('htslib')
makedepends=( 'make' 'gcc')
optdepends=()
source=("https://github.com/vcflib/tabixpp/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('6441f3e3bbeb6c642edc7dea1c4cf8c3')


build() {
  cd "$pkgname"-${pkgver}
  make CC=gcc HTS_HEADERS=/usr/include/htslib HTS_LIB=/usr/lib/libhts.so PREFIX=/usr
}

package() {
  cd $srcdir/"$pkgname"-${pkgver}
  install -Dm 755 tabix.hpp $pkgdir/usr/include/tabix/tabix.hpp
  install -Dm 755 tabix.cpp $pkgdir/usr/include/tabix/tabix.cpp
  install -Dm 755 tabix++ $pkgdir/usr/bin/tabix++

  install -Dm 755 libtabix.so.1 ${pkgdir}/usr/lib/libtabix.so.1
  install -Dm 755 libtabix.a $pkgdir/usr/lib/libtabix.a

  ln -s /usr/lib/libtabix.so.1 ${pkgdir}/usr/lib/libtabix.so
  ln -s /usr/lib/libtabix.so   ${pkgdir}/usr/lib/libtabixpp.so
}
