# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6
pkgver=0.6.3902
pkgrel=3
pkgdesc="Your army is a blob of liquid and you have to try and eat your opponents. Complete rewrite of Liquidwar 5.x"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'gtk2' 'sqlite' 'guile2.0' 'glu' 'curl')
optdepends=("liquidwar6-extra-maps: contributed extra maps")
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d605549afae403439524e572322e45ebf5b6db8ea59505e5d51cb581a8b5e6a4')

prepare() {
  # Do not break build
  sed 's/-DLW6_GNU -Werror/-DLW6_GNU/' -i $pkgname-$pkgver/configure
  # Force guile2.0
  sed 's/guile-config/&2.0/g;s/dummy guile;/dummy guile2.0;/' -i $pkgname-$pkgver/configure
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname \
              --disable-mod-csound --disable-mod-caca --enable-allinone \
              --enable-silent-rules
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
