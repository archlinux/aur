# Maintainer: n3b0j5a <nebojsa@keemail.me>

pkgname=pcalc-lts
pkgver=0.8.1
pkgrel=1
pkgdesc="A command-line programmer's calculator handling HEX/DEC/OCT/BIN"
arch=('any')
url="https://github.com/jurassiclizard/pcalc-lts"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
conflicts=('pcalc' 'pcalc-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jurassiclizard/pcalc-lts/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe752f9f791245a34ad37147d19ac80cf5c9e2ac2c643dd1e15a2c47458bbd39')

build() {
  cd "$srcdir"
  bsdtar -xf $pkgname-$pkgver.tar.gz || return 1
  cmake $pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release -B $pkgname-$pkgver
  cmake --build $pkgname-$pkgver --config Release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 pcalc "$pkgdir/usr/bin/pcalc"
  install -Dm644 EXAMPLE.md "$pkgdir/usr/share/doc/$pkgname/EXAMPLE"
}
