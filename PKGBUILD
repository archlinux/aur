# Contributor: Thomas Jost <thomas.jost@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtikz-svn
pkgver=231
pkgrel=1
pkgdesc="A small application helping you to create TikZ diagrams (from the LaTeX pgf package)"
arch=('i686' 'x86_64')
url="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language/"
license=('GPL')
depends=('poppler-qt5' 'shared-mime-info' 'desktop-file-utils')
makedepends=('texlive-core')
conflicts=('ktikz' 'ktikz-svn')
provides=('ktikz')
makedepends=('subversion'  'qt5-tools')
install=qtikz.install
source=('qtikz::svn://hackenberger.at/svnroot/ktikz/trunk')
md5sums=('SKIP')
_svnmod=qtikz

pkgver() {
  cd "$srcdir"/${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $srcdir/$_svnmod
  [ -d buildqt ] || mkdir buildqt 
  cd buildqt
  qmake ../qtikz.pro PREFIX=/usr 
  make 
}

package() {
  cd $srcdir/$_svnmod
  cd buildqt
  make INSTALL_ROOT=$pkgdir install 
}
