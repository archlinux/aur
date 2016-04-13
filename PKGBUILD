# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=texinfo-svn
pkgver=7118
pkgrel=1
pkgdesc="GNU documentation system for on-line information and printed output"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL')
groups=('base' 'base-devel')
depends=('coreutils')
makedepends=('subversion')
provides=('texinfo')
conflicts=('texinfo')
install=texinfo.install
source=("texinfo::svn://svn.sv.gnu.org/texinfo/trunk")
md5sums=('SKIP')
options=('!makeflags' 'libtool')
_svnmod=texinfo

pkgver() {
  cd "$srcdir"/"${_svnmod}"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir"/"${_svnmod}"
  sed -i 's+$srcdir+$texinfo_srcdir+' configure.ac
}

build() {
  cd "$srcdir"/"${_svnmod}"
  ./autogen.sh 
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir"/"${_svnmod}"
  make DESTDIR="$pkgdir/" install
}
