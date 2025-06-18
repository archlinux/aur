# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.7.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'protobuf')
_tarball=mairu-$pkgver.tar.gz
source=($_tarball::https://github.com/sorah/mairu/archive/v$pkgver.tar.gz)
sha256sums=('fe241ad99454f2c1c0a5baef08446c1726117136cd6780d1f1c70f77b440cbac')
sha512sums=('cb5a672423aa2090047647003bba5b671c3a65a626900dbd6cd764256133bc443575df768cd049683fbae0414c7facb3c96783172e6b0e562f3c6da6c35d15c7')
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

