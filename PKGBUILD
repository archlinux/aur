# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=apngasm
pkgver=3.1.10
pkgrel=1
pkgdesc="tool for assembling apng files"
arch=('i686' 'x86_64')
url="https://github.com/apngasm/apngasm"
license=('LGPL')
conflicts=('apng-utils')
depends=('libpng' 'boost-libs')
makedepends=('cmake' 'boost' 'git')
source=("git+$url.git#commit=553cce10585283fabc1053977a09ad976aa3e2f0")
sha512sums=('SKIP')

build() {
  cd $pkgname
  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}"/usr/man/man1/apngasm.1 "${pkgdir}"/usr/share/man/man1/apngasm.1
  rm -r "${pkgdir}"/usr/man
}

