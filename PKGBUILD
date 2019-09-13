# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=201908.0
pkgrel=1
pkgdesc="A formal specification language with an associated toolset."
arch=('i686' 'x86_64')
depends=('boost' 'qt5-base' 'glu')
makedepends=('cmake' 'gcc')
url=http://www.mcrl2.org
license=('custom')
source=("http://mcrl2.org/download/release/$pkgname-$pkgver.tar.gz")
sha256sums=('5f3b48392a1ab283617dd279e5ba45f5b29ca7f30c94c86bf8f1b9d2047d9dc4')
install=mcrl2.install

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_RPATH=/usr/lib/mcrl2 .
  make $MAKEFLAGS
}

package() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -P cmake_install.cmake

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
