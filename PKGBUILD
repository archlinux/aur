# Contributor: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=free42
pkgver=1.5.7
pkgrel=1
pkgdesc="A complete re-implementation of the HP-42S calculator and the HP-82240 printer."
arch=('i686' 'x86_64')
url="http://thomasokken.com/free42/"
license=('GPL')
depends=('libxmu' 'gtk2')
source=("http://thomasokken.com/free42/upstream/$pkgname-nologo-$pkgver.tgz")
md5sums=('b2a6e76f81133cb86d98afe038da9385')

build() {

  cd "$srcdir/$pkgname-nologo-${pkgver}/gtk"

  echo 'LIBS := ${LIBS} -lX11' >> Makefile

  make cleaner
  make
  make clean
  make BCD_MATH=1
}

package() {
  cd "$srcdir/$pkgname-nologo-${pkgver}/gtk"

  install -d "$pkgdir/usr/bin"
  cp free42bin "$pkgdir/usr/bin"
  cp free42dec "$pkgdir/usr/bin"
  echo "$pkgdir/usr/share/doc/Free42"
  install  -d  "$pkgdir/usr/share/$pkgname"
  cp README "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
