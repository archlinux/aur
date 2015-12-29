# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-ess-git
pkgver=15.09.125.g837454b
pkgrel=2
pkgdesc="Emacs Speaks Statistics: A Universal Interface for \
 Statistical Analysis - git-version"
arch=('any')
url="http://ess.r-project.org"
license=('GPL')
depends=('emacs-julia-mode' 'r')
makedepends=('git')
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
prepare() {
  cd "$srcdir/$_gitname/doc"
  [ -h texinfo.tex ] || ln -s /usr/share/automake-1.15/texinfo.tex texinfo.tex
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
