# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win
pkgver=2.1
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="https://kx.studio/Applications:Carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla-git')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/v2.1/Carla_2.1-linux32.tar.xz")
   sha256sums+=('699650f4892691504d34eec3561828dbd54260db9947e97948879efe8f5d6fc8')
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/v2.1/Carla_2.1-linux64.tar.xz")
   sha256sums+=('2a6d07da633facc375a66a31ca052358fe29b69b24fe177f6041478c14eec36f')
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

