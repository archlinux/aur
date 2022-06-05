# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove
pkgver=4.17.4.1
pkgrel=2
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('ee248ad169f7d13d275b987e0e328c76')
sha1sums=('6ed9f67aeeb1f711a197ae4d19fb58ba8307bda4')
sha256sums=('3fd763625367962de39a66b8fa103b41e17c87d3a0bdf9cac7a93e26e135198c')


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

