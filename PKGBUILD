# Contributor: Anthony Garcia <lagg@[moltenrock]bit.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-jabber-git
pkgver=0.8.92.116.g2ef76cf
pkgrel=2
pkgdesc="A Jabber client written in emacs lisp"
arch=('any')
url="http://emacs-jabber.sourceforge.net/"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-jabber')
conflicts=('emacs-jabber')
_gitname=emacs-jabber
source=("git://${_gitname}.git.sourceforge.net/gitroot/${_gitname}/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's|-|.|g'
}
  
build() {
  cd "$_gitname"
  autoreconf  -i
  ./configure --prefix=/usr --with-gconf-schema-file-dir=/etc/gconf/schemas \
      --libexecdir=/usr/lib/emacs-jabber
  make 
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
} 
