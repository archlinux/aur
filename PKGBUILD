# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=cvm
pkgver=1.0.10
pkgrel=1
pkgdesc='Stack-based virtual machine'
arch=('x86_64')
url="https://github.com/number571/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c4adfa3334cf012c8000cbf284866d687253c13d1a4c1d02e8ef9865c1066dd')
makedepends=('gcc')
depends=('glibc')

build() {
  cd "$pkgname-$pkgver"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  "./$pkgname" build examples/caesar.asm -o caesar.bcd
  "./$pkgname" run caesar.bcd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
