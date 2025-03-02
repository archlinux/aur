# Maintainer: luckyluke <NR2WG23@proton.me>
pkgname=trackfs-rs
pkgver=0.1.3
_pkgver=0.1.3
pkgrel=0
pkgdesc="Fast FUSE filesystem splitting FLAC with CUE into individual track files"
arch=(x86_64)
url="https://github.com/datasone/trackfs-rs"
license=('MIT')
depends=('gcc-libs' 'fuse')
makedepends=('cargo-nightly' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/datasone/$pkgname/archive/$_pkgver.tar.gz")
sha512sums=('a71d513bdb5cc5c9b5394988ccefe44775b1e866cbc81241115e621c4b34efb9b17b32f993620cb7776420d02217afe861ad73fcbc3df5ae31a8e4b6e9282fec')
options=(!debug !lto)

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$pkgname-$_pkgver/target/release/trackfs-rs" "$pkgdir/usr/bin/trackfs-rs"
  install -Dm644 "$pkgname-$_pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$pkgname-$_pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "$pkgname-$_pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
