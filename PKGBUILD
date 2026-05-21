# Maintainer: def1de contact@def1de.com
pkgname=dumpr
pkgver=0.2.1
pkgrel=1
pkgdesc="Rust CLI tool for generating repository dumps with directory trees and concatenated source output."
arch=('x86_64')
url="https://github.com/iktrnch/dumpr"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')

# Release tarball from the git tag v${pkgver}
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7598b62fc8176c751977287b5fc3f29fa9e0ed0c015ffa4887b504867294c1b6')

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
