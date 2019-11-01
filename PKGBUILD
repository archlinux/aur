# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-magit-popup
_github_org="magit"
_github_repo="magit-popup"
pkgver=2.13.0
pkgrel=1
pkgdesc="A generic interface for toggling switches and setting options and then invoking an Emacs command which does something with these arguments"
arch=('any')
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs>=24.4' 'emacs-dash>=2.13.0' 'emacs-async>=1.9.2')
makedepends=('git')
provides=('emacs-magit-popup')
conflicts=('emacs-magit<=2.11.0')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_github_repo}"
  unset EMACS
  make LOAD_PATH="-L /usr/share/emacs/site-lisp" \
       lisp info
}

package() {
  cd "$srcdir/${_github_repo}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 magit-popup.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/info
  install -m 644 magit-popup.info ${pkgdir}/usr/share/info/
}
