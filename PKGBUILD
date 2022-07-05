# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=202206.1
pkgrel=1
pkgdesc="A formal specification language with an associated toolset."
arch=('i686' 'x86_64')
depends=('qt5-base' 'glu' 'hicolor-icon-theme')
optdepends=('python: for easily running the included examples')
makedepends=('boost' 'cmake' 'gcc>=7.0')
url=http://www.mcrl2.org
license=('custom')
source=("http://mcrl2.org/download/release/$pkgname-$pkgver.tar.gz")
sha256sums=('2a82edf0853fbc2758ab326e90db9a65f97c6d688e281d14c561c47508f76ee5')
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
