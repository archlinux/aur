# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove
pkgver=4.17.4.4
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('4ff4721b9b8e36c900ec5d41fc2c2f68')
sha1sums=('e99c497d0b5a36631ed2a9b408943fa4db85eadb')
sha256sums=('81712312a9ed2ff76efc337a6e08ed90801ed383bb25c2c75dc500a828ecf195')


build() {
  cd $pkgname-$pkgver
  make SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" TERMCAPLIB=-lncurses \
  JOVEHOME=/usr SHARDIR=/usr/share/jove TMPDIR=/var/tmp \
  RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/bash
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/{bin,lib/jove,share/{jove,man/man1}}
  make JOVEHOME="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
}

