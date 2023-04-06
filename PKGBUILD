# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.2.1
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('5d85546f53d76838dfd9f6122a44442f289ea105271a07e6ae99c40173256a7811c275d2656f52ff534d67af9762514af3ca45d685b5ff17b3a0a271e6f1a734')

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
