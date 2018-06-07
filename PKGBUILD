# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-with-editor-git
_github_org="magit"
_github_repo="with-editor"
pkgver=2.7.3.r0.ad5bb005ed3a
pkgrel=1
pkgdesc="Use the Emacsclient as the $EDITOR of child processes"
arch=('any')
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs>=24.4')
provides=('emacs-with-editor')
conflicts=('emacs-with-editor')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_github_repo}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${_github_repo}"
  unset EMACS
  make EFLAGS="-L /usr/share/emacs/site-lisp -L ${srcdir}/${_gitrepo}/lisp" \
       lisp info
}

package() {
  cd "$srcdir/${_github_repo}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 with-editor.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/info
  install -m 644 with-editor.info ${pkgdir}/usr/share/info/
}
