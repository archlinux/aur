# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-magit
pkgver=2.90.1
pkgrel=1
pkgdesc="It's Magit! A Emacs mode for Git."
arch=('any')
_github_org="magit"
_github_repo="magit"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
makedepends=('git')
depends=('emacs>=25.1' 'git>=2.0.0' 'emacs-dash>=2.14.1' 'emacs-with-editor>=2.8.0')
provides=('emacs-magit')
conflicts=('emacs-magit-git')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_github_repo}"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L /usr/share/emacs/site-lisp/graphql -L /usr/share/emacs/site-lisp/treepy -L ${srcdir}/magit/lisp" \
       lisp docs
}

package() {
  cd "$srcdir/${_github_repo}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
