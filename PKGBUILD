# Maintainer: Pinak Dhabu <thepinak503@duck.com>
pkgname=echomind
pkgver=0.3.0
pkgrel=1
pkgdesc="AI-powered CLI tool with multiple provider support, streaming, and interactive mode"
arch=('x86_64')
url="https://github.com/thepinak503/echomind"
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
optdepends=('jq: for JSON output formatting')
provides=('echomind')
conflicts=('echomind-git')
source=("$pkgname::git+https://github.com/thepinak503/echomind.git")

build() {
  export RUSTFLAGS="--remap-path-prefix=$(pwd)=."
  cargo clean --manifest-path "$pkgname/Cargo.toml"
  cargo build --release --manifest-path "$pkgname/Cargo.toml"
}

package() {
  install -Dm755 "$pkgname/target/release/echomind" "$pkgdir/usr/bin/echomind"
  install -Dm644 "$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$pkgname/CONTRIBUTING.md" "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 "$pkgname/config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 "$pkgname/echomind.1" "$pkgdir/usr/share/man/man1/echomind.1"
}
