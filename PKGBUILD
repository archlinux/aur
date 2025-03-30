# Maintainer: Digua Dong <dongdigua@outlook.com>
pkgname=wl-binclock
pkgver=1.1.2
pkgrel=2
pkgdesc="binary clock for wayland in rust"
arch=('x86_64')
url="https://github.com/dongdigua/wl-binclock"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3479e7d78fbe2b8e4a136638da3604f2e660da729f1a848bdebaba8a6f943c30')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
