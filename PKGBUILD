# Maintainer:  Alexej Magura <amagura28@gmail.com>
# Maintainer:  ruantu <mtwget@gmail.com>
pkgname=libzlog
_realname=zlog
pkgver=1.2.15
pkgrel=1
pkgdesc="a reliable pure C logging library"
arch=('i686' 'x86_64')
url="http://hardysimpson.github.com/zlog"
license=('LGPL')
depends=(glibc)
makedepends=(lyx hevea)
source=("https://github.com/HardySimpson/$_realname/archive/$pkgver.tar.gz")
md5sums=('155f841543f947bf21112ae4328e7152')

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
