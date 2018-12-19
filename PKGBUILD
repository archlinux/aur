# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-debstatus
pkgver=0.2.0
pkgrel=1
pkgdesc="cargo-tree for debian packaging"
url="https://github.com/kpcyrd/cargo-debstatus"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('68770be752ff06e53b8264471b9a0fa724eec4dd5fae2785d1e2a9da0eafd41542f79daa3b8b56fbf40372da8aa30664d6f119ca71396628c70670519c5f0f65')

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
