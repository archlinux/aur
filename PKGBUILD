# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=gnumeric-pure-hg
pkgver=5445.6b7c8b14cb4b
pkgrel=1
pkgdesc="Gnumeric plugin for the Pure programming language"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('gnumeric>=1.12.4' 'pure')
makedepends=('mercurial')
license=('GPL')
provides=('gnumeric-pure=0.13')
conflicts=('gnumeric-pure')
source=(hg+https://bitbucket.org/purelang/pure-lang)
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pure-lang
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd $srcdir/pure-lang/gnumeric-pure
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/pure-lang/gnumeric-pure
  make DESTDIR=$pkgdir install
}
