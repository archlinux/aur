pkgname=mic-indicator
pkgver=0.1.1
pkgrel=1
pkgdesc="PipeWire microphone tray indicator."
arch=('x86_64')
url="https://github.com/lincot/mic-indicator"
license=('GPL-3.0-only')
depends=('pipewire' 'qt6-base')
makedepends=('cmake')
provides=('mic-indicator')
conflicts=('mic-indicator-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fa12f1856e3d6d930289e34a7c37b3d538e8196763bfebce05de1359106ed791')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm755 "build/mic-indicator" "$pkgdir/usr/bin/mic-indicator"

  for status in off low high; do
    install -Dm644 "res/icons/mic-indicator-$status.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/mic-indicator-$status.png"
  done
}
