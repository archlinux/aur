# Maintainer: Andrea Fontana <andrea.fontana@example.com>
pkgname=qrc
pkgver=1.0.6
pkgrel=1
pkgdesc="A CLI tool to create QR Codes and output them as PNG/PPM/SVG or as ASCII/Dense art to the terminal"
options=('!debug' 'strip')
arch=('x86_64')
url="https://github.com/trikko/qr"
license=('MIT')
makedepends=('ldc' 'dub')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55dac81aa959c033b8589668411959be9e07289f008c25205d1fc2095c0965c7')

build() {
  cd "qr-$pkgver/example"
  dub build --compiler=ldc2 --config=static --build=release
}

package() {
  cd "qr-$pkgver/example"
  install -Dm755 qrc "$pkgdir/usr/bin/qrc"
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
