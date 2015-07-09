# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-ess-git
pkgver=15.03.1.89.gecdd856
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for \
 Statistical Analysis - git-version"
arch=('any')
url="http://ess.r-project.org"
license=('GPL')
depends=('emacs' 'r')
makedepends=('git' 'texlive-plainextra')
provides=('ess' 'emacs-ess')
conflicts=('emacs-ess' 'emacs-ess-svn')
options=('docs' '!makeflags')
install=ess.install
source=("emacs-ess::git://github.com/emacs-ess/ESS.git")
md5sums=('SKIP')
_gitname="emacs-ess"


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | tr '-' '.' |cut -c2-
}

build() {
  cd "$srcdir/$_gitname"
  make prefix=/usr 
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir/usr LISPDIR=$pkgdir/usr/share/emacs/site-lisp/ess \
    INFODIR=$pkgdir/usr/share/info/ install 
}
