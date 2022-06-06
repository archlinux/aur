# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove
pkgver=4.17.4.2
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('7977d1242a9c34798209854b1dc9b2f3')
sha1sums=('873c5497fe16f53df698a155251bc74f48274243')
sha256sums=('813ecb5e600ac96d11dfaf00f21b77233203fac08f489157c2625243402f410f')


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

