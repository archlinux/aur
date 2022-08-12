# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>

pkgname=inlyne
pkgver=0.1.5
pkgrel=1
pkgdesc='A GPU powered yet browsless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
_commit='72083e6e35165e69276f8fa701f9980f937b9bc5'
source=("$pkgname::git+$url.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
