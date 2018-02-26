# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri-git
pkgver=2.12.22.85.g7ecf421
pkgrel=1
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
makedepends=('ghostscript' 'imagemagick6' 'texlive-core' 'perl-perl4-corelibs')
source=("git+https://github.com/dankelley/gri.git")
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - .
}

build() {
  cd ${pkgname%-git}
  aclocal
  autoconf
  automake --add-missing
  CXXFLAGS+=" -fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR=$pkgdir install
}
