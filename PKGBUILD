# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mkcl-git
pkgver=1.1.9.99.g8ca4595
pkgrel=1
pkgdesc="ManKai Common Lisp -- git-version"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/mkcl/"
license=('LGPL3' 'custom')
depends=('gawk')
makedepends=('git')
provides=('common-lisp' 'cl-asdf')
conflicts=('mkcl')
source=("git+https://gitlab.common-lisp.net/mkcl/mkcl.git")
options=('staticlibs' '!makeflags')
md5sums=('SKIP')
_gitname="mkcl"

pkgver() {
  cd $srcdir/$_gitname
  git describe --tags | sed 's|-|.|g'|cut -c2-
}

build() {
  cd "$srcdir/$_gitname"
  CC=gcc ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make prefix="$pkgdir/usr" install
  install -m 644 -D "Copyright" \
	  "$pkgdir/usr/share/licenses/$pkgname/Copyright"
  find "$pkgdir" -name "*.a" -exec chmod 644 {} \;
}
