# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
 
_realname='graphene'
pkgname="$_realname-git"
pkgver=0.99.3.268.8e11ee1
pkgrel=1
pkgdesc='A thin layer of graphic data types'
arch=('i686' 'x86_64')
url='https://github.com/ebassi/graphene/'
depends=('glib2')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
license=('MIT')
 
source=('git+https://github.com/ebassi/graphene.git')
md5sums=('SKIP')
 
subver() {
  PREFIX="m4_define(\[graphene_$1_version\], \["
  echo $(grep "$PREFIX" configure.ac | eval sed "'s/$PREFIX//'" | sed 's/\])//')
}
 
pkgver() {
  cd $_realname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver major).$(subver minor).$(subver micro).$revision.$hash
}
 
build() {
  cd $_realname
  ./autogen.sh --prefix=/usr
  make
}
 
package() {
  cd $_realname
  make DESTDIR="$pkgdir" install
}
