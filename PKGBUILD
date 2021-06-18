# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-with-editor
pkgver=3.0.4
pkgrel=1
pkgdesc="Use the Emacsclient as the $EDITOR of child processes"
arch=('any')
_github_org="magit"
_github_repo="with-editor"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
makedepends=()
depends=('emacs' 'emacs-async')
provides=('emacs-with-editor')
conflicts=('emacs-with-editor-git')
install="${pkgname}.install"
source=("https://github.com/${_github_org}/${_github_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e5001cb0793f7d3e17d83121f557d7586f8c3760e71f5cfc3fdcf5057712c50')

build() {
  cd "$srcdir/${_github_repo}-${pkgver}"
  unset EMACS
  make EFLAGS="-L /usr/share/emacs/site-lisp -L ${srcdir}/${_gitrepo}/lisp" \
       lisp info
}

package() {
  cd "$srcdir/${_github_repo}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 with-editor.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/info
  install -m 644 with-editor.info ${pkgdir}/usr/share/info/
}
