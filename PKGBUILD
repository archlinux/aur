# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.0.6
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64')
url='https://aitum.tv/#vertical'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('a0b5d0de37334d6a4f75def0b964d7ad77b7911a8171688308680d49dac6e2df1246708d6ef94f731ff54257c25502570f3809cd7846c6e66a92aecfb451dab3')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build -DBUILD_OUT_OF_TREE=On --install-prefix "$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  #cd $pkgname-$pkgver
  #cmake --install build
  cd $pkgname-$pkgver/build/rundir/Release
  install -D -m644 obs-plugins/64bit/vertical-canvas.so $pkgdir/usr/lib/obs-plugins/vertical-canvas.so
  install -D -m644 data/obs-plugins/vertical-canvas/data/images/overflow.png $pkgdir/usr/share/obs/obs-plugins/vertical-canvas/images/overflow.png
  install -D -m644 data/obs-plugins/vertical-canvas/data/locale/en-US.ini $pkgdir/usr/share/obs/obs-plugins/vertical-canvas/locale/en-US.ini
}
