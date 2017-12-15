# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-magit
pkgver=2.11.0
pkgrel=1
pkgdesc="It's Magit! A Emacs mode for Git."
arch=('any')
_github_org="magit"
_github_repo="magit"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs' 'git' 'emacs-dash>=2.13.0' 'emacs-with-editor-git>=2.6.0')
makedepends=('git' 'ed')
provides=('emacs-magit')
conflicts=('emacs-magit')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_github_repo}"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L ${srcdir}/magit/lisp" \
       lisp docs
}

package() {
  cd "$srcdir/${_github_repo}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
