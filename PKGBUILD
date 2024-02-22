# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.4.1
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64' 'x86_64_v3')
url='https://aitum.tv/products/vertical'
license=('GPL-2.0-or-later')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('ff7b674256bc5bfd336704c1ba422701df3e8131ef1c0239e099b52a19590193bbb4a0579a0ae015b424ad08619448767afef01102a4a3fa7faf2b6917e579b7')

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
