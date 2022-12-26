# Maintainer: TwoFinger
# Contributor: taij33n <bwbuiz@gmail.com>
pkgname=picolisp
pkgver=22.12
pkgrel=1
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="http://www.picolisp.com"
arch=('x86_64')
license=('MIT')
depends=('openssl' 'libffi' 'readline' 'ncurses')
makedepends=('clang' 'llvm')
source=("https://software-lab.de/picoLisp-$pkgver.tgz")
md5sums=("9e45416e6047d79e08729f9b70184331")

build() {
  cd $srcdir/pil21/src
  make
  make clean
}

package() {
  install -d -m755 ${LIBDIR:=$pkgdir/usr/lib/$pkgname}
  cp -a $srcdir/pil21/* $LIBDIR

  install -d -m755 ${BINDIR:=$pkgdir/usr/bin}
  mv $LIBDIR/bin/picolisp $BINDIR
  mv $LIBDIR/bin/pil $BINDIR
  mv $LIBDIR/bin/vip $BINDIR

  install -d -m755 ${MAN1DIR:=$pkgdir/usr/share/man/man1}
  mv $LIBDIR/man/man1/*.1 $MAN1DIR
  rmdir $LIBDIR/man/man1
  rmdir $LIBDIR/man

  install -d -m755 ${DOCDIR:=$pkgdir/usr/share/doc/$pkgname}
  mv $LIBDIR/doc/* $DOCDIR
  chmod 0644 $DOCDIR/app.html
  rmdir $LIBDIR/doc

  install -d -m755 ${DATADIR:=$pkgdir/usr/share/$pkgname}
  mv $LIBDIR/COPYING $DATADIR
  mv $LIBDIR/README $DATADIR
  mv $LIBDIR/INSTALL $DATADIR
  mv $LIBDIR/test $DATADIR
  mv $LIBDIR/misc $DATADIR
  mv $LIBDIR/src $DATADIR
  mv $LIBDIR/img $DATADIR
  mv $LIBDIR/lib.css $DATADIR

  install -d -m755 ${COMPDIR:=$pkgdir/usr/share/bash-completion/completions/}
  mv $LIBDIR/lib/bash_completion $COMPDIR/$pkgname
}
