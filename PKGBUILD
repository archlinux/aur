# Maintainer: bipin kumar <bipin@ccmb.res.in>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri
pkgver=2.12.23
pkgrel=10
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
depends=('perl')
makedepends=('ghostscript' 'imagemagick' 'texlive-core' 'perl-perl4-corelibs')
source=("https://github.com/dankelley/gri/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7199abb7be98a0de7cade63122112c57edeab6eea289b4c567ad171ba0a620ae')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgver
  aclocal
	autoconf
	automake --add-missing
}

build() {
  cd $pkgname-$pkgver
  CXXFLAGS+=" -fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
