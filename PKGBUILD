# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-ghub
_github_org="magit"
_github_repo="ghub"
pkgver=3.2.0
pkgrel=1
pkgdesc="Emacs - Minuscule client library for the Github API"
arch=('any')
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-graphql' 'emacs-treepy')
makedepends=('git' 'texlive-core')
provides=('emacs-ghub')
source=("git+https://github.com/${_github_org}/${_github_repo}.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_github_repo}"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L /usr/share/emacs/site-lisp/graphql -L /usr/share/emacs/site-lisp/treepy -L ${srcdir}/ghub" \
       lisp doc
}

package() {
  cd "$srcdir/${_github_repo}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 *.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/doc/emacs-ghub/
  install -m 644 *.{pdf,html} ${pkgdir}/usr/share/doc/emacs-ghub
  cp -r ghub ${pkgdir}/usr/share/doc/emacs-ghub
}
