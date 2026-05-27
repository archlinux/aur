# Maintainer: jamesarch <https://github.com/jamesarch>
# Contributor: jamesarch

pkgname=createrepo-rs
pkgver=0.1.8
pkgrel=1
pkgdesc="Pure Rust RPM repository metadata generator — dnf/yum-compatible, zero FFI, single static binary"
arch=('x86_64' 'aarch64')
url="https://github.com/jamesarch/createrepo_rs"
license=('GPL-2.0-or-later')
makedepends=('cargo' 'rust>=1.76')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f93784bf1d9504827c17009288f1f122e81a5975e651102405e0985be401f14')

build() {
  cd "createrepo_rs-$pkgver"
  cargo build --release
}

check() {
  cd "createrepo_rs-$pkgver"
  cargo test --release
}

package() {
  cd "createrepo_rs-$pkgver"
  install -Dm755 "target/release/createrepo_rs" \
    "$pkgdir/usr/bin/createrepo_rs"
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "README_zh.md" \
    "$pkgdir/usr/share/doc/$pkgname/README_zh.md"
}
