# Maintainer: Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

pkgname=wg-proxy
pkgver=0.1.0
pkgrel=1
pkgdesc="Per-program WireGuard tunnel"
url="https://github.com/krant/wg-proxy"
license=('Apache-2.0')
arch=('x86_64')
depends=('glibc' 'libgcc')
makedepends=('rust')
install=wg-proxy.install
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('adfd928fa9f9f83df638a4800e66a7d1388be925c88625eb70193e3e5a5bd57b2f9abaa61d15c4ccd145501a6c8f5fc460ab4efcf39b00b8714e6a68fa0ef354')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  #install -vDm644 -t "$pkgdir/usr/share/man/man1" wg-proxy.1
}
