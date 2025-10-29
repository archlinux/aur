# Maintainer: Pinak Dhabu <thepinak503@duck.com>
pkgname=echomind
pkgver=0.3.0
pkgrel=1
pkgdesc="AI-powered CLI tool with multiple provider support, streaming, and interactive mode"
arch=('x86_64')
url="https://github.com/thepinak503/echomind"
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo')
optdepends=('jq: for JSON output formatting')
provides=('echomind')
conflicts=('echomind-git')

build() {
  export RUSTFLAGS="--remap-path-prefix=$(pwd)=."
  cargo clean
  cargo build --release
}

package() {
  cd ..
  install -Dm755 target/release/echomind "$pkgdir/usr/bin/echomind"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 echomind.1 "$pkgdir/usr/share/man/man1/echomind.1"
}
