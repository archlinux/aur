# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.11.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'protobuf')
options=(!lto)
_tarball=mairu-$pkgver.tar.gz
source=($_tarball::https://github.com/sorah/mairu/archive/v$pkgver.tar.gz)
sha256sums=('4b52f32761c8073ee0b066e2bf3e11c62307ed7f4c7d7ed59501a06a5a052879')
sha512sums=('d0bcf84314cf596cfb8791a617701a21ac8adede3bbc2e5a7439d63b170c46aae7c4a8ad0d46d3962f1e1bbc3a0a66e3e036bcdb708b9d775577df742909d54b')
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

