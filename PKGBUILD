# Contributor: Eduardo Martins Lopes < edumlopes at gmail dot com >

pkgname=g95
pkgver=0.94
pkgrel=2
pkgdesc="A stable, production Fortran 95 compiler available for multiple cpu architectures and operating systems"
arch=('i686' 'x86_64')
url="http://g95.sourceforge.net"
license="GPL"
depends=('blas' 'lapack' 'gcc-libs' )
makedepends=()
provides=('g95')
conflicts=()
replaces=()
backup=()
install=
if [ "$CARCH" = "i686" ]; then
source=(http://ftp.g95.org/g95-x86-linux.tgz g95.install)
md5sums=('663c7cc38029ab13f6d87ec21295e1fc' '852098b27f3b5b8154bcb38a2350a7bb')
fi

if [ "$CARCH" = "x86_64" ]; then
source=(http://ftp.g95.org/g95-x86_64-64-linux.tgz g95.install)
md5sums=('815ca0a16198e6334e8661cd276bd5a4' '852098b27f3b5b8154bcb38a2350a7bb')
fi 

build() {
  mkdir -p ${srcdir}/g95-install/share/doc
  mv -f ${srcdir}/g95-install/{INSTALL,G95Manual.pdf}  ${srcdir}/g95-install/share/doc/
}
package() {
  mkdir -p ${pkgdir}/usr
  mkdir -p ${pkgdir}/lib
  cp -r ${srcdir}/g95-install/* ${pkgdir}/usr
  cd ${pkgdir}/usr/bin
if [ "$CARCH" = "i686" ]; then  
  ln -s i686-pc-linux-gnu-g95 g95

fi

if [ "$CARCH" = "x86_64" ]; then
  ln -s x86_64-unknown-linux-gnu-g95 g95
fi
}
