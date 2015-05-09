# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6
pkgver=0.6.3902
pkgrel=1
pkgdesc="Your army is a blob of liquid and you have to try and eat your opponents. Complete rewrite of Liquidwar 5.x"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'gtk2' 'sqlite3' 'guile' 'glu' 'curl')
optdepends=("liquidwar6-extra-maps: contributed extra maps")
install=$pkgname.install
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('d605549afae403439524e572322e45ebf5b6db8ea59505e5d51cb581a8b5e6a4'
            'SKIP')
validpgpkeys=("47621EBA5FA3E62F299CB0BBDE3F2BCDFD409E94") # Christian Mauduit

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname \
              --disable-mod-csound --disable-mod-caca --enable-allinone
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
