# Contributor: Naoya Inada <inaoya@kushinada.org>
#     Updated: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=smlsharp
pkgver=3.2.0
pkgrel=1
pkgdesc="A new programming language in the Standard ML family"
arch=('x86_64')
url="http://www.pllab.riec.tohoku.ac.jp/smlsharp/"
license=('custom')
depends=('gmp' 'yajl')
makedepends=('llvm=3.7.1' )
source=(http://www.pllab.riec.tohoku.ac.jp/smlsharp/download/$pkgname-$pkgver.tar.gz)
md5sums=('8ea32075594d1e038612fad3a6fc2513')
options=(libtool staticlibs)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make LLC='/usr/bin/llc -relocation-model=pic'  
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  for file in LICENSE SMLNJ_LICENSE; do
    install -D -m 644 $file $pkgdir/usr/share/licenses/$pkgname/$file
  done
}
