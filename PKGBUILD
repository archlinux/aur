# Maintainer:  Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan.husmann@t-online.de>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Just Lest <just.lest@gmail.com>
# Contributor: Daniel White <daniel@whitehouse.id.au>

pkgname=emacs-magit-git
_gitname="magit"
pkgver=2.6.0
pkgrel=1
pkgdesc="It's Magit! A Emacs mode for Git."
arch=('any')
url="http://github.com/${_gitname}/${_gitname}"
license=('GPL3')
depends=('emacs' 'git' 'emacs-dash>=2.12.1' 'emacs-with-editor-git>=2.5.0')
makedepends=('ed')
provides=('emacs-magit')
install="${pkgname}.install"
source=("git+https://github.com/${_gitname}/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  # Latest annotated tag (release)
  git describe --abbrev=0
}

build() {
  cd "$_gitname"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L ${srcdir}/${_gitname}/lisp" \
       lisp docs
}

package() {
  cd "$_gitname"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
