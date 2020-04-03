# Contributor: Anthony Garcia <lagg@[moltenrock]bit.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-jabber-git
pkgver=0.8.92.r119.gfff3382
pkgrel=1
epoch=1
pkgdesc="A Jabber client written in emacs lisp"
arch=('any')
url="http://emacs-jabber.sourceforge.net/"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-jabber')
conflicts=('emacs-jabber')
source=("git://${pkgname%-git}.git.sourceforge.net/gitroot/${pkgname%-git}/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's|-|.r|' | tr - .
}
  
build() {
  cd ${pkgname%-git}
  autoreconf  -i
  ./configure --prefix=/usr --with-gconf-schema-file-dir=/etc/gconf/schemas \
      --libexecdir=/usr/lib/emacs-jabber
  make 
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir"/usr/share/emacs/site-lisp/hexrgb.el{,c}
} 
