# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xcl
pkgver=0.0.0.291
pkgrel=3
pkgdesc="An native-code implementation of Common Lisp"
arch=('i686' 'x86_64')
url="http://armedbear.org/"
license=('GPL')
depends=('gcc-libs') 
makedepends=('git')
provides=('common-lisp')
source=(http://armedbear.org/$pkgname-$pkgver.tar.gz 'etcxclrc')
md5sums=('c74e675d220e78d815e9818b969ddf00'
         '6f426ad20c0086460067915091cefae8')
backup=('etc/xclrc')
options=('!makeflags')

build() {
  cd $srcdir/$pkgname
  make
  yes "(quit)"|./xcl --eval "(REBUILD-LISP)"
}

package() {
  install -Dm755 "$srcdir/$pkgname/xcl" "$pkgdir/usr/bin/xcl"
  install -Dm644 "$srcdir/etcxclrc" "$pkgdir/etc/xclrc"
  install -Dm644 "$srcdir/etcxclrc" "$pkgdir/etc/xclrc"
  install -dm755 "$pkgdir/usr/share/xcl"
  cd "$srcdir/$pkgname"
  cp -r lisp compiler clos "$pkgdir/usr/share/xcl"
}
