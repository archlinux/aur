# Maintainer: def1de contact@def1de.com
pkgname=dumpr
pkgver=0.3.0
pkgrel=1
pkgdesc="Rust CLI tool for generating repository dumps with directory trees and concatenated source output."
arch=('x86_64')
url="https://github.com/iktrnch/dumpr"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')

# Release tarball from the git tag v${pkgver}
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c11f0ecbb2d7dcededd15e169fe5cdad7f521c4a5c1df4e6ba460c3f0638550a')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/dumpr "$pkgdir/usr/bin/dumpr"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
