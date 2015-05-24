# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=copper
pkgver=1.6
pkgrel=1
pkgdesc="An experimental programming language"
arch=('i686' 'x86_64')
url="http://tibleiz.net/copper/"
license=('GPL2')
depends=()
[ "$CARCH" = "x86_64" ] && depends=('llvm')
options=()
source=("http://tibleiz.net/download/copper-${pkgver}-src.tar.gz"
        "llvm-lib.patch")
md5sums=('7f36f1b9ce28e3c366f9442aa6155384'
         '30724dadbbd8d409218e17bfb299f1d2')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  if [ "$CARCH" == "x86_64" ];then  
    patch -p0 < "$srcdir/llvm-lib.patch"
    make prefix=/usr boot64
  else
    make prefix=/usr
  fi
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  if [ "$CARCH" == "x86_64" ];then
    make BACKEND=llvm prefix=/usr DESTDIR=${pkgdir} install
  else
    make prefix=/usr/ DESTDIR=${pkgdir} install
  fi
}

# vim:set ts=2 sw=2 et:
