# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=comlink
pkgver=0.1.1
pkgrel=1
pkgdesc='An experimental IRC client'
arch=('x86_64')
url="https://github.com/rockorager/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('070ba419f3e3f321d446f92d3681001e9fe9253e021b39b62d1ddc59f41606c2')
makedepends=('zig')
depends=('glibc' 'lua')

prepare() {
  cd "$pkgname-$pkgver"
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  zig build install --prefix 'out' -Doptimize=ReleaseSafe
}

check() {
  cd "$pkgname-$pkgver"
  zig build test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "out/bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
