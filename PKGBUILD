# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win
pkgver=2.2.0
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="https://kx.studio/Applications:Carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla-git')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}-${pkgver}-source::https://github.com/falkTX/Carla/releases/download/v2.2.0/Carla_2.2.0-linux32.tar.xz")
   sha256sums+=('2d552221afe0a44216ad10f010c8edf8ad98249b25737637df64ec0175fd1018')
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}-${pkgver}-source::https://github.com/falkTX/Carla/releases/download/v2.2.0/Carla_2.2.0-linux64.tar.xz")
   sha256sums+=('f04f8355f7c9f90c668873180c366737cf4214ad77cc1dde4549e5623c726c97')
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

