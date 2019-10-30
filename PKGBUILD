# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-with-editor
pkgver=2.8.3
pkgrel=1
pkgdesc="Use the Emacsclient as the $EDITOR of child processes"
arch=('any')
_github_org="magit"
_github_repo="with-editor"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs>=24.4' 'emacs-async>=1.9')
provides=('emacs-with-editor')
conflicts=('emacs-with-editor-git')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git#tag=v$pkgver")
md5sums=('SKIP')

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
