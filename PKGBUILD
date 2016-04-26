# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-with-editor-git
_gitprofile="magit"
_gitrepo="with-editor"
pkgver=2.5.1
pkgrel=1
pkgdesc="Use the Emacsclient as the $EDITOR of child processes"
arch=('any')
url="http://github.com/${_gitprofile}/${_gitrepo}"
license=('GPL3')
depends=('emacs' 'emacs-dash=2.12.1')
provides=('emacs-with-editor')
install="${pkgname}.install"
source=("git+https://github.com/${_gitprofile}/${_gitrepo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  # Latest annotated tag (release)
  git describe --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$_gitrepo"
  make EFLAGS="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L ${srcdir}/${_gitrepo}/lisp" \
       lisp info
}

package() {
  cd "$_gitrepo"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 with-editor.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/info
  install -m 644 with-editor.info ${pkgdir}/usr/share/info/
}
