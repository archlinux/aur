# Maintainer: Stefan Husmann <stefan.husmann@t-online.de>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Just Lest <just.lest@gmail.com>
# Contributor: Daniel White <daniel@whitehouse.id.au>

pkgname=emacs-magit-git
pkgver=1.2.0.2280.gef0311d
pkgrel=1
pkgdesc="It's Magit! A Emacs mode for Git."
arch=('any')
url="http://github.com/magit/magit"
license=('GPL3')
depends=('emacs' 'git' 'emacs-git-modes-git')
makedepends=('automake' 'autoconf' 'ed')
provides=('emacs-magit')
conflicts=('emacs-magit')
install="${pkgname}.install"
_gitname="magit"
source=('git+https://github.com/magit/magit.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Git tag
  echo $(git describe --tags|sed 's/-/./g')
}

build() {
  cd "$_gitname"
  make EFLAGS="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/git-modes" lisp docs
}

package() {
  cd "$_gitname"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
