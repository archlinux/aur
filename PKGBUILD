# Maintainer: Nikolaos Bezirgiannis <bezeria at gmail dot com>

pkgname=mcrl2
pkgver=201409.1
pkgrel=1
pkgdesc="A formal specification language with an associated toolset."
arch=('i686' 'x86_64')
depends=('boost' 'qt4' 'glu')
makedepends=('cmake')
url=('http://www.mcrl2.org')
license=('custom')
source=("http://mcrl2.org/download/release/$pkgname-$pkgver.tar.gz")
md5sums=('32818c4111aa406033e865c30ac7862b')
install='mcrl2.install'

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_RPATH=/usr/lib/mcrl2 .
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -P cmake_install.cmake

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
