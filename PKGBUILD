# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.1.3
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('f63f26b71db296473762bf52ddb6d45d3f818073bd28b24425855490fd9d246024ca67b8d523ee34229806c9f42c2d8552be66ac2a51839243140857280cca02')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build -DBUILD_OUT_OF_TREE=On --install-prefix "$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $pkgname-$pkgver
  cmake --install build
  rm -rf "$pkgdir"/usr/{data,obs-plugins}
}
