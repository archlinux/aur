# Maintainer: Tamir Zahavi-Brunner <tamir.z3@gmail.com>
pkgname=yek
pkgver=0.21.0
pkgrel=1
pkgdesc="A tool to serialize a repository into chunks of text files"
arch=('x86_64')
url="https://github.com/bodo-run/yek"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bodo-run/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2c0e863e0f49f690977910498a1b8dd151c625bf04b88a7d6ff20553590b6ccf')

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
  install -Dm755 "target/release/yek" "$pkgdir/usr/bin/yek"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/licenses/$pkgname/CHANGELOG.md"
  install -Dm644 "yek.yaml" "$pkgdir/usr/share/licenses/$pkgname/yek.yaml"
}
