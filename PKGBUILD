# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=202607.0
pkgrel=1
pkgdesc="A formal specification language with an associated toolset."
arch=('i686' 'x86_64')
provides=('mcrl2')
conflicts=('mcrl2')
depends=('qt6-base' 'glu' 'hicolor-icon-theme')
optdepends=('python: for easily running the included examples')
makedepends=('boost' 'cmake' 'gcc>=7.0')
url=http://www.mcrl2.org
license=('Boost')
source=("http://mcrl2.org/download/release/$pkgname-$pkgver.tar.gz")
sha256sums=('b3590e2845a24ef0a1a7e9cf51fd3a2366e9a07ef3418e14a271bee506d2e289')
install=mcrl2.install

build() {
  mkdir -p $srcdir/$pkgname-$pkgver-build
  cd $srcdir/$pkgname-$pkgver-build
  cmake -DCMAKE_INSTALL_RPATH=/usr/lib/mcrl2 $srcdir/$pkgname-$pkgver
  make $MAKEFLAGS
}

package() {
  cd $srcdir/$pkgname-$pkgver-build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -P cmake_install.cmake
}
