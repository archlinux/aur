# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=idba
pkgver=1.1.1
pkgrel=1
pkgdesc="iterative de Bruijn graph assembler"
arch=('i686' 'x86_64')
url="http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/"
license=('GPL2')
depends=('gcc-libs')
source=("http://hku-idba.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('400fd18404b154f423cb355934ed5617')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  for i in $(find bin -type f | xargs file | awk -F: '/ELF/ { print $1 }' | grep -vE '\.o$') ; do
    install -Dm755 $i $pkgdir/usr/bin/$(basename $i)
  done

  rm $pkgdir/usr/bin/test
}
