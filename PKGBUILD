# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=man2texi
pkgver=0.01
pkgrel=4
pkgdesc="Converts well-structured man pages to Texinfo format"
arch=('i686' 'x86_64')
url=("http://www.math.utah.edu/pub/man2texi/")
depends=('gawk' 'bash')
license=('GPL')
source=(http://www.math.utah.edu/pub/man2texi/$pkgname-$pkgver.tar.bz2 noiso8859.diff)
md5sums=('96489411b5f1aff644abc12ef50510e7'
         '2b8d5d15a4ff735808d63b19e12ac3b1')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man/man1 

  make SHRLIBDIR=/usr/share/$pkgname
  patch $pkgname.sh $srcdir/noiso8859.diff
}
package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.man $pkgdir/usr/share/man/man1/$pkgname.1
  install -Dm644 $pkgname.awk \
    $pkgdir/usr/share/$pkgname/$pkgname.awk
  sed -i 's+\/usr\/local\/bin+\/bin+' \
    $pkgdir/usr/share/$pkgname/$pkgname.awk
  sed -i 's+SHRLIBDIR=.+SHRLIBDIR=/usr/share/man2texi+' \
    $pkgdir/usr/bin/$pkgname
}

