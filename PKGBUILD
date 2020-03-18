# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=jove
pkgver=4.17.2.7
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/jonmacs/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e0728e2ae6abe65dedc0835c4b4ea6ae')
sha1sums=('58eddc609814ddacffcb8861d0dd9827eb0bde88')
sha256sums=('878312176a903cfeae3a990b193b373411fa74e370b7997b6e1d0994797c7f8f')


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

