# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=roadfighter
pkgver=1.0.1269
pkgrel=4
pkgdesc="Unofficial remake of Konami's Road Fighter for the MSX"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www2.braingames.getput.com/roadf"
depends=('sdl_image' 'sdl_mixer' 'sdl_sound' 'sdl_ttf')
source=("http://braingames.jorito.net/roadfighter/downloads/$pkgname.src_$pkgver.tgz"
        "roadfighter.patch")
sha256sums=('c6ed315c4b2bf25d598ffa6b5dfd471e7f187ff29b86fd3213054fb6be7c57e7'
            '34de8f4b76220e493b4d44554d448e743a7ea2ea5a58e49208e954a19a861de5')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < ../roadfighter.patch

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
