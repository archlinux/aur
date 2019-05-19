# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com>
# Contributor: Charlie Cox <ccoxiv@yahoo.com>

pkgname=atanks
pkgver=6.5
pkgrel=2
pkgdesc="Atomic Tanks"
url="http://atanks.sourceforge.net"
license=('GPL')
arch=('x86_64')
makedepends=('sed')
depends=('allegro4' 'gcc-libs')
source=("http://downloads.sourceforge.net/project/atanks/atanks/atanks-${pkgver}/atanks-${pkgver}.tar.gz")
sha256sums=('32182b2752a77ff362c378fc04b7c51fc15345caa4c8deaad59cc850dad2322e')

build() {
  cd atanks-${pkgver}
  make
}

package() {
  cd atanks-${pkgver}
  make DESTDIR="$pkgdir" INSTALL="install -c" install

  sed -i 's/^Name=atanks/Name=Atomic Tanks/' atanks.desktop
  sed -i 's/^Categories=Game;/Categories=Game;StrategyGame;/' atanks.desktop

  install -Dm644 atanks.desktop "$pkgdir"/usr/share/applications/atanks.desktop
  install -Dm644 atanks.png "$pkgdir"/usr/share/pixmaps/atanks.png
}
