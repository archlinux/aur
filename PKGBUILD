# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=gpmd85emulator
pkgver=0.11.1912_beta
pkgrel=1
pkgdesc="Multiplatform GNU/GPL Tesla PMD 85 Emulator"
arch=('i686' 'x86_64')
url="https://github.com/mborik/GPMD85Emulator"
license=('GPL')
depends=('gcc-libs' 'sdl')
makedepends=('gendesk')
conflicts=('gpmd85emulator-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/mborik/GPMD85Emulator/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('fe5d8cdde453cff6890a8cdace11d13e')

prepare() {
  cd "${srcdir}"
  gendesk -f --pkgname "GPMD85Emulator" \
             --exec "GPMD85emu" \
             --pkgdesc "$pkgdesc" \
             --categories 'Game;System;Emulator'
}

build ()
{
  cd $srcdir/GPMD85Emulator-$pkgver
  aclocal
  automake --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/GPMD85Emulator-$pkgver
  mkdir -p $pkgdir/usr/share/gpmd85emu
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/GPMD85Emulator.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
