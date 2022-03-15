# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-ess-git
pkgver=18.10.3.git.9041.39eba283
pkgrel=1
pkgdesc="A Universal Interface for Statistical Analysis - git-version"
arch=(any)
url="https://ess.r-project.org"
license=(GPL)
depends=(r emacs)
makedepends=(git wget texlive-latexextra)
provides=(ess emacs-ess)
conflicts=(emacs-ess emacs-ess-svn)
options=('docs' '!makeflags')
install=ess.install
source=(emacs-ess::git+https://github.com/emacs-ess/ESS.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s.%s" $(cat VERSION | sed 's+snapshot+.git+') $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}"/usr LISPDIR="${pkgdir}"/usr/share/emacs/site-lisp/ess \
    INFODIR="${pkgdir}"/usr/share/info/ install || true
}
