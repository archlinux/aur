# Maintainer: Piotr Szerszynski <contact@pszer.com>

pkgname=meoxskins
pkgver=1.2
pkgrel=1
pkgdesc="A Minecraft skin editor built with LÖVE2D"
arch=('any')
url="https://github.com/pszer/meoxskins"
license=('MIT')
depends=('love')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pszer/meoxskins/releases/download/$pkgver/full-source-$pkgver.tar.gz")
sha256sums=('SKIP')  # replace with real checksum after testing

build() {
  cd "$srcdir/"
  zip -9 -r meoxskins.love . -x "*.git*" "docs/*" "PKGBUILD" ".SRCINFO"
}
package() {
  cd "$srcdir/"
  install -Dm644 meoxskins.love "$pkgdir/usr/share/$pkgname/meoxskins.love"
  install -Dm755 -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/meoxskins"
  echo 'exec love /usr/share/meoxskins/meoxskins.love "$@"' >> "$pkgdir/usr/bin/meoxskins"
  chmod +x "$pkgdir/usr/bin/meoxskins"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
