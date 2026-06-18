# Maintainer: june
# https://koi.rip

pkgname=meowtd
pkgver=0.1.0
pkgrel=3
pkgdesc="send cute MOTDs to your (girl|enby|boy)friends' computers"
arch=('x86_64' 'aarch64')
url="https://git.koi.rip/koi/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('d70258bf67e7b5c8d4a16d85bea98a6afadf5185779ebcdaad82d17412d87576')
makedepends=('zig')
depends=('libssh2')

build() {
  cd "$pkgname-$pkgver"
  zig build -Dcpu=baseline --release=fast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "zig-out/bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm755 "zig-out/bin/$pkgname-receive" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
