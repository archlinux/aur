# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=gnumeric-pure-git
pkgver=r5862.7f1c857d
pkgrel=1
pkgdesc="Gnumeric plugin for the Pure programming language"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('gnumeric>=1.12.4' 'pure')
makedepends=('git')
license=('GPL')
provides=('gnumeric-pure')
conflicts=('gnumeric-pure')
replaces=('gnumeric-pure-hg')
source=(git+https://github.com/agraef/pure-lang.git)
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pure-lang
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/pure-lang/gnumeric-pure
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/pure-lang/gnumeric-pure
  make DESTDIR=$pkgdir install
}
