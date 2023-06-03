# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.2.4
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('3a6e005bf7cbdbb8f6b09a18b349ce93cc5580d61fc8699531877c31cafbe6c99b052c58c45fb5111eac49e522e2c5c17f781749b547dbe822ca64aa3d242065')

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
