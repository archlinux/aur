# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-git
pkgver=r4012
pkgrel=1
pkgdesc="A Bible study tool -- git version"
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword-svn' 'gtkhtml4' 'biblesync-git')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'git' 'python2')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
source=(git+https://github.com/crosswire/xiphos.git)
md5sums=('SKIP')
_gitname=xiphos

pkgver() {
  cd "$_gitname"
  printf "r%s" $(git rev-list --count HEAD)
}

build() {
  cd "$_gitname"
  CXX=g++ python2 ./waf --prefix=/usr --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --enable-webkit2 build 
}

package() {
  cd "$_gitname"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}
