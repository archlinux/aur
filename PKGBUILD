# Maintainer:  Alexej Magura <amagura28@gmail.com>
pkgname=libzlog
_realname=zlog
pkgver=1.2.14
pkgrel=1
pkgdesc="a reliable pure C logging library"
arch=('i686' 'x86_64')
url="http://hardysimpson.github.com/zlog"
license=('LGPL')
depends=(glibc)
makedepends=(lyx hevea)
source=("https://github.com/HardySimpson/$_realname/archive/$pkgver.tar.gz")
md5sums=('fd277b54669848bceecd4fd6251109b4')

build()
{
  cd "$srcdir/$_realname-$pkgver"

  make all
  make doc || make doc
}

package()
{
  cd "$srcdir/$_realname-$pkgver"

  make PREFIX="$pkgdir/usr" install

  install -d "$pkgdir/usr/share/$pkgname/doc"

  rename mence mance doc/per*.txt # performence.txt is misspelled: this corrects it.
  install -t "$pkgdir/usr/share/$pkgname/doc" "doc/"*
  rm "$pkgdir/usr/share/$pkgname/doc/makefile"
  rm "$pkgdir/usr/share/$pkgname/doc/"*.lyx
}
# vim:set ts=2 sw=2 et:
