# Maintainer: LovecraftianHorror <LovecraftianHorror@pm.me>

pkgname=cargo-deadlinks
pkgver=0.8.1
pkgrel=1
pkgdesc='Cargo plugin for checking your documentation for broken links'
arch=(x86_64)
url="https://github.com/deadlinks/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('90dc97084a99f310f5572f7b64b1e3bf1c90ea2f3d199028aa5f8de560cf1891d1afe9c50daccfbc69336019f148ae307441f4be03fa3a5ba1ed3ac590803bc4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked --bin $pkgname
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
