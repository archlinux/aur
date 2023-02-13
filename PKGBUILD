# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.1.0
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz
        'type-fix.patch')
b2sums=('e4c369cb3e6c342a94112d1fcf01ef0095d064bfba154dc38eee00afc539f6155f730eff5d018a59b060acef33ca49cce3b61d0b0873ed17deecf11e1af80a8e'
        '1ad9b113cacf4036d2b536f3991a05349d9d7d907d9ef4ff46e4b0d8ebbf399dd47934cee272185ce656e9c381930e4b9a8be0689388ddd969fa33e1b9eda165')

prepare() {
  cd $pkgname-$pkgver
  patch < "$srcdir"/type-fix.patch
}

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
