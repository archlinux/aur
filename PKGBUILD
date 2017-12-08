# Maintainer:  Alexej Magura <amagura28@gmail.com>
pkgname=libzlog
_realname=zlog
pkgver=1.2.12
pkgrel=3
pkgdesc="a reliable pure C logging library"
arch=('i686' 'x86_64')
url="http://hardysimpson.github.com/zlog"
license=('LGPL')
depends=(glibc)
makedepends=(lyx texlive-bin hevea)
options=(!buildflags)
source=("https://github.com/HardySimpson/$_realname/archive/$pkgver.tar.gz"
	"src-makefile.patch"
       )
md5sums=('ae9b7ede5cf3a62c3092bacf37f70de4'
         '69098be923a08e9773fc07ee24ad2787')

prepare()
{
  cd "$srcdir/$_realname-$pkgver"
  patch -p0 < "$srcdir/src-makefile.patch"
}

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
  cp doc/UsersGuide-EN.html doc/Guide.html
  cp doc/GettingStart-EN.txt doc/README

  install -t "$pkgdir/usr/share/$pkgname/doc" doc/Guide.html doc/README doc/zlog.conf doc/performance.txt
}
# vim:set ts=2 sw=2 et:
