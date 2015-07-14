# Contributor: scrawler <scrawler@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newlisp-devel
_pkgname=newlisp
pkgver=10.6.4
pkgrel=2
pkgdesc="A LISP like, general purpose scripting language. Ongoing development version."
url="http://www.newlisp.org"
license=('GPL3')
arch=('x86_64' 'i686')
depends=('readline' 'libffi')
optdepends=('java-environment: for gui server')
provides=('newlisp')
conflicts=('newlisp')
options=('docs' '!makeflags')
source=("http://www.newlisp.org/downloads/development/inprogress/${_pkgname}-$pkgver.tgz")
md5sums=('dd9a179a322a53495f1bccd8b8017d29')
install=$_pkgname.install

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i 's+/usr/local+/usr+' makefile_linuxLP64_utf8_ffi \
      makefile_linux_utf8_ffi
  sed -i 's+/libffi-3.0.13+/libffi-3.2.1+' makefile_linuxLP64_utf8_ffi \
      makefile_linux_utf8_ffi
 }

build() {
  cd $srcdir/$_pkgname-$pkgver
  make clean
  make 
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man \
    datadir=$pkgdir/usr/share install
  rm $pkgdir/usr/bin/$_pkgname
}
