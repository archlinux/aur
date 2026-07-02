# Maintainer: june
# https://koi.rip

pkgname=meowtd
pkgver=0.3.0
pkgrel=1
pkgdesc="send cute MOTDs to your (girl|enby|boy)friends' computers"
arch=('x86_64' 'aarch64')
url="https://git.koi.rip/koi/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('8b1e17bd487be22c8670396bf52d0946edbe7b7db3ea92e0fc40d74c61cf7e0d')
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
