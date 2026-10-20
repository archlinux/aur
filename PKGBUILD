# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.12.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'protobuf')
options=(!lto)
_tarball=mairu-$pkgver.tar.gz
source=($_tarball::https://github.com/sorah/mairu/archive/v$pkgver.tar.gz)
sha256sums=('270a6b364343666855724f3de98967dc1dce8fdf210510d66e4eded42de06d0d')
sha512sums=('5b46b7acbce838778290b648dfd079d67aeecb47a250a05b40ef48e5bc857ae0ae8e62a44a224befab6efa273365813cb52a5fba11181db28530b4967419b2b0')
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

