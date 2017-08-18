# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=goonies
pkgver=1.4.1528
pkgrel=4
pkgdesc="Remake of Konami's The Goonies for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/goonies"
depends=('sdl_image' 'sdl_mixer' 'glu')
source=("http://braingames.jorito.net/goonies/downloads/$pkgname.src_$pkgver.tgz"
        goonies.patch)
sha256sums=('9e9c1e67a41dfae512e975b6931828cdc82f07397921ca0a41a81c3020a73799'
            '841f8e5d8d93958f358443b929b15ba036e463b68e948e6147a3bd5c7cf29a5f')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < ../goonies.patch

  sed -i "s/-g3 -O3/$CFLAGS/" build/linux/Makefile
  sed -i "/LDFLAGS =/s/$/ $LDFLAGS/" build/linux/Makefile
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir"/usr install
}
