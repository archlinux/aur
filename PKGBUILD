# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri-git
pkgver=2.12.23.r20.gd9969d1
pkgrel=1
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
depends=('perl')
conflicts=('gri')
provides=('gri')
makedepends=('git' 'ghostscript' 'imagemagick' 'texlive-core' 'perl-perl4-corelibs')
source=("git+https://github.com/dankelley/gri.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | tr - . | cut -c2-
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
