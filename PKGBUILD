# Maintainer: def1de contact@def1de.com
pkgname=digest
pkgver=0.1.0
pkgrel=1
pkgdesc="Rust CLI tool for generating repository digests with directory trees and concatenated source output."
arch=('x86_64')
url="https://github.com/iktrnch/git-digest"
license=('MIT')
makedepends=('cargo' 'git')
depends=()

# Release tarball from the git tag v${pkgver}
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dabf367d679b57991d88bf4053e5a36a678c55d12e8cc83042795ab8a6489fc9')

build() {
  cd "git-digest-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "git-digest-${pkgver}"

  install -Dm755 target/release/digest "$pkgdir/usr/bin/digest"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
