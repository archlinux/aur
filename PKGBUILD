# Contributor: L42y <423300@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-mew-git
pkgver=6.8.11.g91a78fd
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Messaging in the  Emacs World"
url="http://www.mew.org/"
license=('custom')
depends=('emacs')
optdepends=('ruby')
conflicts=('emacs-mew')
provides=('emacs-mew')
source=('mew-git::git://github.com/kazu-yamamoto/Mew.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname#emacs-}
  # Git tag
  echo $(git describe --tags|sed 's/-/./g'|tr -d v)
}

build() {
  cd ${pkgname#emacs-}
  ./configure --prefix=/usr
}

package() {
  cd ${pkgname#emacs-}
  make DESTDIR="$pkgdir/" install
  install -D -m644 00copyright \
    "$pkgdir"/usr/share/licenses/emacs-mew-git/00copyright 
}
