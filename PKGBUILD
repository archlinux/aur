# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=apngasm
pkgver=3.1.6
pkgrel=2
pkgdesc="tool for assembling apng files"
arch=('i686' 'x86_64')
url="https://github.com/apngasm/apngasm"
license=('LGPL')
conflicts=('apng-utils')
depends=('libpng' 'boost-libs')
makedepends=('cmake' 'boost' 'git')
source=("git+$url.git#commit=de1c87cd7696384be3235eb07766766891474e09")
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

