# Maintainer: Philipp Möller <bootsarehax@gmail.com>

pkgname=emacs-gnus-git
pkgver=m0.11.r178.g3af70ac
pkgrel=1
pkgdesc="Emacs Gnus from git"
arch=('any')
url="http://gnus.org/"
depends=('emacs')
makedepends=('git')
license=('GPL')
provides=('emacs-gnus')
conflicts=('emacs-gnus')
source=('emacs-gnus-git::git+http://git.gnus.org/gnus.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
  cd "$srcdir/$pkgname"
  install -d $pkgdir/usr/share/emacs/site-lisp/gnus
  cp -r $srcdir/$pkgname/lisp/* $pkgdir/usr/share/emacs/site-lisp/gnus
  install -d $pkgdir/usr/share/emacs/site-lisp/gnus-contrib
  cp -r $srcdir/$pkgname/contrib/ $pkgdir/usr/share/emacs/site-lisp/gnus-contrib
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}


