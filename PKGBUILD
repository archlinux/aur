# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <lgsarmientop-ala-unal.edu.co>
pkgname=emacs-monky-git
_pkgname=emacs-monky
pkgver=r163.9885717
pkgrel=1
pkgdesc="Emacs extension that provides an interactive interface for mercurial hg"
url="http://ananthakumaran.in/monky/index.html"
arch=('any')
license=('unknown')
depends=('emacs')
makedepends=('git')
provides=($_pkgname)

source=($_pkgname::git+https://github.com/ananthakumaran/monky.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){

  git clone ${srcdir}/$_pkgname ${srcdir}/$_pkgname-build || return 1
  cd ${srcdir}/$_pkgname-build
  make

}

package(){
  cd ${srcdir}/$_pkgname-build/ || return 1
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/monky || return 1
  cp -a ./* ${pkgdir}/usr/share/emacs/site-lisp/monky || return 1
}
