# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=birdtray
pkgver=0.2
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL')
depends=(qt5-base sqlite3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gyunaev/$pkgname/archive/${pkgver}.tar.gz")
sha1sums=('8d49f7699eeb58faaede2e351e10a0d07b894a80')

build() {
  mkdir build && cd build
  qmake-qt5 ../$pkgname-$pkgver/src
  make
}

package() {
  cd build

  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/birdtray
  install -d "$pkgdir"/usr/include/birdtray

  install birdtray "$pkgdir"/usr/bin/birdtray
  install -m644 *.o "$pkgdir"/usr/lib/birdtray/
  install -m644 *.h "$pkgdir"/usr/include/birdtray/
}
