# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri
pkgver=2.12.27
pkgrel=2
epoch=1
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url="http://gri.sourceforge.net/"
depends=('perl' 'glibc' 'readline' 'gcc-libs' 'netcdf')
makedepends=('ghostscript' 'netcdf' 'imagemagick' 'texlive-core' 'perl-perl4-corelibs' 'git')
source=('gri::git+https://github.com/dankelley/gri.git')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "$pkgname"
  awk 'NR==2 {print}' configure.ac | sed -e 's/.* \([0-9.]*\).*/\1/'
  # git describe --long --abbrev=7 | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "$pkgname"
  aclocal
	autoconf
	automake --add-missing
}

build() {
  cd "$pkgname"
  CXXFLAGS+=" -fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
