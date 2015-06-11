# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=flexc++
pkgver=2.02.00
pkgrel=1
pkgdesc="C++ scanner generator"
arch=('i686' 'x86_64')
url="http://flexcpp.sourceforge.net/"
license=('GPL')
# Versions taken from the build-depends file in sources
depends=('libbobcat>=3.01.00')
makedepends=('icmake>=7.19.0' 'gcc>=4.7.1' 'yodl>=3.00.0')
optdepends=()
source=("http://downloads.sourceforge.net/project/flexcpp/${pkgver}/flexc++_${pkgver}.orig.tar.gz")
md5sums=('8a2b9be97b6cfde1b599b6ac925f39fe')

build() {
  cd "$srcdir/flexc++-${pkgver}"

  CXXFLAGS="$CXXFLAGS --std=c++11"
  ./build program
  ./build man
  ./build manual
}

package() {
  cd "$srcdir/flexc++-${pkgver}"
  ./build install program "${pkgdir}/usr/bin/flexc++"
  ./build install skel "${pkgdir}/usr/share/flexc++"
  ./build install man "${pkgdir}/usr/share/man"
  ./build install manual "${pkgdir}/usr/share/doc/flexc++"
  ./build install std "${pkgdir}/usr/share/doc/flexc++"
}
