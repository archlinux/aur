# Maintainer:
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: dkremer <david.kremer.dk@gmail.com>

pkgname=ptoc
pkgver=3.61
pkgrel=1
pkgdesc="ANSI/Turbo Pascal to C/C++ converter"
arch=('i686' 'x86_64')
url="http://www.garret.ru/ptoc/Readme.htm"
license=('custom: Shareware')
source=("http://www.garret.ru/ptoc-$pkgver.tar.gz"
        "ptoc-arch-fixes.patch")
sha256sums=('b3d93d30f6571500b23cbbfe3dd50b0ef539095b5b7f18b6787fa02a08e459d7'
            '3aea08928e9da0e52435cf80da208319473a1295a84b201363ea69c874725810')
options=('staticlibs')

prepare() {
  # fix paths and add our flags
  patch -Np0 < ptoc-arch-fixes.patch
}

build() {
  make -C ptoc
}

package() {
  cd ptoc

  install -d "$pkgdir"/usr/{bin,lib}
  make PREFIX="$pkgdir/usr" install

  install -d "$pkgdir"/usr/share/ptoc
  cp -rup {t,}ptoc.pas ptoc.cfg examples "$pkgdir"/usr/share/ptoc
}
