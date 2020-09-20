# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win
pkgver=2.2.0RC2
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="https://kx.studio/Applications:Carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla-git')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/v2.2.0-RC2/Carla_2.2.0-RC2-linux32.tar.xz")
   sha256sums+=('e8d712bc0fcf7f434fec350f185b6baa03df579dd86f7c38e25d0378bcec2fce')
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/v2.2.0-RC2/Carla_2.2.0-RC2-linux64.tar.xz")
   sha256sums+=('0472aa002a8edcc2b41c74be1741c9d8401381b57d1d90e7b7a197fc1fde9d64')
fi

prepare() {
cd "$srcdir"
  mv Carla* "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/carla.lv2"
  mkdir -p "$pkgdir/usr/lib/carla"
  cp *.exe "$pkgdir/usr/lib/carla/"
  cp *.dll "$pkgdir/usr/lib/carla/"
}

