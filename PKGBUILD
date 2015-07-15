# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xiphos-svn
pkgver=4911 
pkgrel=1
pkgdesc="A Bible study tool -- svn version"
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkitgtk' 'libgsf' 'gconf' 'sword' 'gtkhtml4' 'biblesync')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'subversion')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
install=xiphos-svn.install
source=('xiphos::svn://svn.code.sf.net/p/gnomesword/code/trunk')
md5sums=('SKIP')
_svnmod=xiphos

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_svnmod"
  CXX=g++ python2 ./waf --prefix=/usr configure 
LANG=C  python2 ./waf --prefix=/usr build 
}

package() {
  cd "$srcdir/$_svnmod"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}
