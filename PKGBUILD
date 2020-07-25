# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=apngasm
pkgver=3.1.6
pkgrel=1
pkgdesc="tool for assembling apng files"
arch=('i686' 'x86_64')
url="https://github.com/apngasm/apngasm"
license=('LGPL')
conflicts=('apng-utils')
depends=('libpng' 'boost-libs')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('cbc6f0ad119a7ce17079be3434e516265bea619ecb46fe147d652bbaff4652a858698df07a072f5095894961137fe32546f75ad603c7483476be7ffe463cf999')

build() {
  cd $pkgname-${pkgver}
  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make
}

package() {
  cd $pkgname-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}"/usr/man/man1/apngasm.1 "${pkgdir}"/usr/share/man/man1/apngasm.1
  rm -r "${pkgdir}"/usr/man
}

