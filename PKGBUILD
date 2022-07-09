# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove
pkgver=4.17.4.6
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('bdce07c7aeb3e78c6a2c8a5bc51d45ef')
sha1sums=('aa337cabf4a4885175f24948148b52fa452537e3')
sha256sums=('17cabdc45f87053fbd43a1af5c3ff99cdda2ad67bf7a972d85c6947aa4aaf5eb')


build() {
  cd $pkgname-$pkgver
  ./jmake.sh SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" TERMCAPLIB=-lncurses \
  JOVEHOME=/usr SHARDIR=/usr/share/jove TMPDIR=/var/tmp \
  RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/bash
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/{bin,lib/jove,share/{jove,man/man1}}
  ./jmake.sh DESTDIR="$pkgdir"/usr install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
}

