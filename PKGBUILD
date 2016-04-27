# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xiphos-git
pkgver=r3896
pkgrel=1
pkgdesc="A Bible study tool -- git version"
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkitgtk' 'libgsf' 'gconf' 'sword' 'gtkhtml4' 'biblesync-git')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'git')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
install=$pkgname.install
source=(git+https://github.com/crosswire/xiphos.git)
md5sums=('SKIP')
_gitname=xiphos

pkgver() {
  cd "$_gitname"
  printf "r%s" $(git rev-list --count HEAD)
}

build() {
  cd "$_gitname"
  CXX=g++ python2 ./waf --prefix=/usr configure 
  python2 ./waf --prefix=/usr build 
}

package() {
  cd "$_gitname"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}
