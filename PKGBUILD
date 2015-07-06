# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=jove
pkgver=4.16.0.73
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="ftp://ftp.cs.toronto.edu/pub/hugh/jove-dev/jove.announce"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=('jove')
conflicts=('jove')
source=("ftp://ftp.cs.toronto.edu/pub/hugh/jove-dev/$pkgname$pkgver.tgz" 
        'license')
md5sums=('d5e826bf05fc1fbe1b7f10571156c735'
         '4484a9dabc94ecb351c7de1f8fa6293e')
sha1sums=('fca6f33465b08eed5b90e24cfb67e61bc5249dcf'
          '9cc577cf2d278bf23c6dcf65d5e1f2eaf1bf48cc')
sha256sums=('9c9e202607f5972c382098d10b63c815ac01e578f432626c982e6aa65000c630'
            '963f7cba6d0d3ca5792c275fa2bd1a810216a6b596feba3d791a240398d242db')

build() {
  cd $srcdir/$pkgname$pkgver
  make SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" TERMCAPLIB=-lncurses \
  JOVEHOME=/usr SHARDIR=/usr/share/jove TMPDIR=/var/tmp \
  RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/bash
}

package() {
  cd $srcdir/$pkgname$pkgver
  mkdir -p $pkgdir/usr/{bin,lib/jove,share/{jove,man/man1}}
  make JOVEHOME=$pkgdir/usr MANDIR=$pkgdir/usr/share/man/man1 install
  install -D -m644 $srcdir/license $pkgdir/usr/share/licenses/jove/license
}

