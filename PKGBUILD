# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zune
pkgver=0.5.8
pkgrel=1
pkgdesc='A Luau runtime, similar to Lune, Node, or Bun.'
url='https://github.com/Scythe-Technology/zune'
license=('MIT')
depends=('glibc')
makedepends=('zig')
arch=('x86_64' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c34cddf7653a8120cf99ad0b86d63f0f48afab827f99bfca44f87b39020e0a77')

prepare() {
  cd "$pkgname-$pkgver"
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  zig build install --prefix 'out' -Doptimize=ReleaseSafe
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "out/bin/zune" "$pkgdir/usr/bin/zune"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
