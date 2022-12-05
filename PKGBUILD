# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove
pkgver=4.17.4.7
pkgrel=2
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('ca852dee892fb3f135ecfcd5fd94810b38581431aa474721c147941af7684ca5')

build() {
  cd $pkgname-$pkgver
  ./jmake.sh SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" TERMCAPLIB=-lncurses \
  JOVEHOME=/usr SHARDIR=/usr/share/jove TMPDIR=/var/tmp \
  RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/bash
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/{bin,lib/jove,share/jove}
  ./jmake.sh JOVEHOME=/usr DESTDIR="$pkgdir" install
  
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
}

