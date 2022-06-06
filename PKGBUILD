# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove
pkgver=4.17.4.3
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('5b7bc4954b93fe45c5ab0baf2e8d1e36')
sha1sums=('cd12e70b034b177cc9f78557ca87e6381586ceb5')
sha256sums=('81ff15a0dd1ab8991540557a142aaa322fdbc833fc89ad1e5b9351f6f3752f6f')


build() {
  cd $srcdir/$pkgname-$pkgver
  make SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" TERMCAPLIB=-lncurses \
  JOVEHOME=/usr SHARDIR=/usr/share/jove TMPDIR=/var/tmp \
  RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/bash
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,lib/jove,share/{jove,man/man1}}
  make JOVEHOME=$pkgdir/usr MANDIR=$pkgdir/usr/share/man/man1 install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/jove/LICENSE
}

