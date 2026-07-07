# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-with-editor
_github_org="magit"
_github_repo="with-editor"
pkgver=3.5.2
pkgrel=1
pkgdesc="Use the Emacsclient as the $EDITOR of child processes"
arch=('any')
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
makedepends=('git')
depends=(
    'emacs'
    'emacs-async'
    'emacs-cond-let'
    'emacs-llama'
)
conflicts=('emacs-with-editor-git')
install="${pkgname}.install"
source=("https://github.com/${_github_org}/${_github_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4bbc01331e8772037838847944b91cdc9d8456e379daad61c8c9d076431ba5dd')

build() {
  cd "$srcdir/${_github_repo}-${pkgver}"
  unset EMACS
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L ${srcdir}/${_gitrepo}/lisp" \
       lisp info
}

package() {
  cd "$srcdir/${_github_repo}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 lisp/with-editor.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/info
  install -m 644 docs/with-editor.info ${pkgdir}/usr/share/info/
}
