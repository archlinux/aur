# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sword-svn
pkgver=3581
pkgrel=1
pkgdesc="Libraries for Bible programs - svn-version"
arch=('i686' 'x86_64')
url="http://www.crosswire.org/sword/"
license=('GPL')
depends=('curl' 'clucene' 'xapian-core')
makedepends=('subversion')
provides=('sword')
conflicts=('sword')
source=('sword::svn+https://www.crosswire.org/svn/sword/trunk/')
sha256sums=('SKIP')
options=('!makeflags')
_svnmod=sword

pkgver() {
  cd "${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$_svnmod"  
  ./autogen.sh
  CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc 
  make
}

package() {
  cd "$_svnmod"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install_config
}
