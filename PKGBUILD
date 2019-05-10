# $Id$
# Maintainer: Fabian Preiss <fpreiss .ATT. uni-wuppertal_dot_de>
# Contributor: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=bison2
PACKAGE=bison
pkgver=2.7.1
pkgrel=2
pkgdesc="The GNU general-purpose parser generator, older version"
arch=('x86_64')
license=('GPL3')
url="http://www.gnu.org/software/bison/bison.html"
depends=('glibc' 'm4' 'sh' 'libiconv')
conflicts=('bison')
groups=('base-devel')
source=("http://ftp.gnu.org/gnu/bison/${PACKAGE}-${pkgver}.tar.gz"{,.sig}
        "hotfix.patch"
)
sha256sums=('08e2296b024bab8ea36f3bb3b91d071165b22afda39a17ffc8ff53ade2883431'
            '588bdf15487db4fe46043717abe84dae644a68c43e040812354e7750738f0fe1'
            '0e953a7a29e18cea5b6f3557cef5072a3af4e708e8a896727d33b78868c36bc8')
validpgpkeys=('7DF84374B1EE1F9764BBE25D0DDCAA3278D5264E')

prepare() {
  patch -p0 < hotfix.patch
}

build() {
  cd ${srcdir}/${PACKAGE}-${pkgver}  
  ./configure --prefix=/usr/local --datadir=/usr/local/share --mandir=/usr/local/man
  make
}

check() {
  cd ${srcdir}/${PACKAGE}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${PACKAGE}-${pkgver}
  make DESTDIR=${pkgdir} install
}
