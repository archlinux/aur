# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri-git
pkgver=2.12.26
pkgrel=1
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
depends=('perl')
conflicts=('gri')
provides=('gri')
makedepends=('git' 'ghostscript' 'imagemagick' 'texlive-core' 'perl-perl4-corelibs')
source=("git+https://github.com/dankelley/gri.git" inputencoding.patch)
sha256sums=('SKIP'
            'b16d82db8958336fe0839c2aef30fd6fb8c75ea217c30e9ce64e06697b867abd')
options=('!makeflags')

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/inputencoding.patch
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
