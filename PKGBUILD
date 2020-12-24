# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributer: Jan de Groot <jgc@archlinux.org>

pkgname=gmp-git
pkgver=6.2.1
pkgrel=1
pkgdesc='A free library for arbitrary precision arithmetic'
arch=(x86_64)
url='https://gmplib.org/'
depends=(gcc-libs sh)
provides=(gmp)
conflicts=(gmp)
license=(LGPL3 GPL)
source=(hg+https://gmplib.org/repo/gmp/)
md5sums=('SKIP')
#validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298')   # Niels Möller

pkgver() {
   cd gmp
   git describe --tags | sed 's/-/+/g'
}

build() {
  cd gmp

  ./configure --build=${CHOST} \
    --prefix=/usr \
    --enable-cxx \
    --enable-fat
  make
}

#check() {
#  cd gmp
#  make check
#}

package() {
  cd gmp
  make DESTDIR="${pkgdir}" install
}
