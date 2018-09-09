# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=201808.0
pkgrel=1
pkgdesc="A formal specification language with an associated toolset."
arch=('i686' 'x86_64')
depends=('boost' 'qt5-base' 'glu')
makedepends=('cmake' 'gcc')
url=http://www.mcrl2.org
license=('custom')
source=("http://mcrl2.org/download/release/$pkgname-$pkgver.tar.gz")
sha256sums=('cf5d75f512a92d3f56b5899f4f226f9225404452afba88e838c660c7e14a8018')
install='mcrl2.install'

build() {
  cd $srcdir
  cmake -DCMAKE_INSTALL_RPATH=/usr/lib/mcrl2 .
  make $MAKEFLAGS
}

package() {
  cd $srcdir
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -P cmake_install.cmake

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
