# Maintainer:  hamki <hamki.do2000@gmail.com>
# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-magit-popup
_github_org="magit"
_github_repo="magit-popup"
pkgver=2.13.3
pkgrel=1
pkgdesc="A generic interface for toggling switches and setting options and then invoking an Emacs command which does something with these arguments"
arch=('any')
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs' 'emacs-dash>=2.13.0' 'emacs-async')
makedepends=()
provides=('emacs-magit-popup')
conflicts=('emacs-magit<=2.11.0')
install="${pkgname}.install"
source=("https://github.com/${_github_org}/${_github_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b15e206530f7bd3d434ac6b45342b16c23783bf6defea77ecc500ee2e4a9c4c5')

build() {
  cd "$srcdir/${_github_repo}-${pkgver}"
  unset EMACS
  make LOAD_PATH="-L /usr/share/emacs/site-lisp" \
       lisp info
}

package() {
  cd "$srcdir/${_github_repo}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 magit-popup.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  mkdir -p ${pkgdir}/usr/share/info
  install -m 644 magit-popup.info ${pkgdir}/usr/share/info/
}
