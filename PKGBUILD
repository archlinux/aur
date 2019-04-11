# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win
pkgver=2.0.0
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="https://kx.studio/Applications:Carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla-git')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/v2.0.0/Carla_2.0.0-linux32.tar.xz")
   sha256sums+=('46b595251fcadb271ad8d73557315e19b8e341727cde94e6441869bcd09389f1')
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/v2.0.0/Carla_2.0.0-linux64.tar.xz")
   sha256sums+=('fe6e27d4f9870b5e0f20a7ec16bbba0ed6b6dec4feb2706ee6f0b9fa27da74a5')
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

