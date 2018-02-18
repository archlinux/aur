# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: big_gie nbigaouette . at . gmail.com

pkgname=gri
pkgver=2.12.23
pkgrel=8
pkgdesc="A script-based language for scientific graphics programming"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gri.sourceforge.net/"
makedepends=('ghostscript' 'imagemagick6' 'texlive-core' 'perl-perl4-corelibs')
source=("http://downloads.sourceforge.net/gri/$pkgname-$pkgver.tar.gz" htmldoc.patch)
sha256sums=('a24e703f30250ed705c0a242aa59a24748259ea7355fca52152f367f45bfd2e7'
            '29602e17d9a94e4ae2fe1bd9f550615c09295c984dc2a2c2a03e23179376cc96')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/htmldoc.patch
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
