# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri
pkgver=20240405.101042
pkgrel=1
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
depends=('perl' 'netcdf')
makedepends=('ghostscript' 'netcdf' 'imagemagick' 'texlive-core' 'perl-perl4-corelibs' 'git')
source=('gri::git+https://github.com/dankelley/gri.git#commit=d9969d1')
md5sums=('fbe0f86bd394f679acab9d296f5e05d2')
options=('!makeflags')

prepare() {
  cd $pkgname
  aclocal
	autoconf
	automake --add-missing
}

build() {
  cd $pkgname
  CXXFLAGS+=" -fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}
