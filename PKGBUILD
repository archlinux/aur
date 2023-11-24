# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.3.0
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('02495e494ef9274d046c69a50ab3b5787fa14fa4db3ecdedbda4c54359ffc41ecead00b0f49a6fd2798062de76d4d25b10dadafb4e803b634b1bf2c0596be5e9')

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
