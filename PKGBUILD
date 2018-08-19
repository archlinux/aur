# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-debstatus
pkgver=0.1.0
pkgrel=1
pkgdesc="cargo-tree for debian packaging"
url="https://github.com/kpcyrd/cargo-debstatus"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a43aa91ca9aab8d0f7d40077ab8976de30029718af7e9d7cbfe72d43cba8f690a4a218caca17c171b29eb017fb68c21a6d8bda5421cabe4165cd8bf8f405817d')

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
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
