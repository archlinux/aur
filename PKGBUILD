# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.3.1
pkgrel=2
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64' 'x86_64_v3')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('e5cf25169a0e0aaa5960a543d5d54f699388278df4661c76ca502d51acf36257b55346d61ae5bee4966020fddb5a1024a962a4d0ebf545dceec7530c9f899480')

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
