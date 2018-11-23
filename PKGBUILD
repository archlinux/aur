# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ess-git
epoch=1
pkgver=8236.b07cfdf6.
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for \
 Statistical Analysis - git-version"
arch=('any')
url="http://ess.r-project.org"
license=('GPL')
depends=('r' 'emacs')
makedepends=('git' 'wget' 'texlive-latexextra')
provides=('ess' 'emacs-ess')
conflicts=('emacs-ess' 'emacs-ess-svn')
options=('docs' '!makeflags')
install=ess.install
source=("emacs-ess::git://github.com/emacs-ess/ESS.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s.%s" $(awk '/defvar ess-version/ {print $3}' lisp/ess-custom.el|sed s+-beta++|tr -d \"|tr - .) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname%-git}
  make prefix=/usr
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir"/usr LISPDIR="$pkgdir"/usr/share/emacs/site-lisp/ess \
       INFODIR="$pkgdir"/usr/share/info/ install 
}
