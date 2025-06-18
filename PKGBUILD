# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.8.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'protobuf')
options=(!lto)
_tarball=mairu-$pkgver.tar.gz
source=($_tarball::https://github.com/sorah/mairu/archive/v$pkgver.tar.gz)
sha256sums=('5e6da78946dd74da63d6bced300e4d2b712740e66280e87aad6ffd957a9854f1')
sha512sums=('935807680eff6aff5df9da52b467177d46e93c08c237a43bd828ee8bfcf8df3e300a4afbc88ac3e2e262c4f48c8107f01c19848006c500713a52daa628a60753')
install=mairu.install

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
  install -Dm755 "target/release/mairu" "$pkgdir/usr/bin/mairu"
}

