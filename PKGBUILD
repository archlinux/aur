# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=apngasm
pkgver=3.1.10
pkgrel=1
pkgdesc="tool for assembling apng files"
arch=('i686' 'x86_64')
url="https://github.com/apngasm/apngasm"
license=('LGPL')
conflicts=('apng-utils' 'apngasm-bin')
depends=('libpng' 'boost-libs')
makedepends=('cmake' 'boost' 'git')
source=("https://github.com/apngasm/apngasm/archive/${pkgver}.tar.gz")
sha512sums=('670d75251ddc771f9b2b4a1f401066f2012a6814bec781b918f1d9e8960835654c66c3d19b4c8920d5186d85af12cdc4bba8b61c8f3d349b4fc70513d8ecb34e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}"/usr/man/man1/apngasm.1 "${pkgdir}"/usr/share/man/man1/apngasm.1
  rm -r "${pkgdir}"/usr/man
}
