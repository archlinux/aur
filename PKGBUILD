# Maintainer:  Esben Haabendal <esben@haabendal.dk>
# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan.husmann@t-online.de>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Just Lest <just.lest@gmail.com>
# Contributor: Daniel White <daniel@whitehouse.id.au>

pkgname=emacs-magit-git
pkgver=2.11.0.r347.c7f6bfe7
pkgrel=1
pkgdesc="It's Magit! A Emacs mode for Git."
arch=('any')
_github_org="magit"
_github_repo="magit"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs' 'git' 'emacs-dash>=2.13.0' 'emacs-with-editor-git>=2.6.0')
makedepends=('ed')
provides=('emacs-magit')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_github_repo}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${_github_repo}"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L ${srcdir}/magit/lisp" \
       lisp docs
}

package() {
  cd "$srcdir/${_github_repo}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
