# Contributor: L42y <423300@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-mew-git
pkgver=6.7rc1.2.g18cd4b1
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Messaging in the  Emacs World"
url="http://www.mew.org/"
license=('custom')
depends=('emacs')
optdepends=('ruby')
conflicts=('emacs-mew')
provides=('emacs-mew')
install=emacs-mew-git.install

source=('mew-git::git://github.com/kazu-yamamoto/Mew.git')
md5sums=('SKIP')
_gitname="mew-git"

pkgver() {
  cd $_gitname
  # Git tag
  echo $(git describe --tags|sed 's/-/./g'|tr -d v)
}

build() {
  cd "$srcdir/$_gitname"

  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -D -m644 $srcdir/$_gitname/00copyright \
    $pkgdir/usr/share/licenses/emacs-mew-git/00copyright 
}
