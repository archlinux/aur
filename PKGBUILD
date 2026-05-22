pkgname=baml
pkgver=0.11.0.alpha.4116
pkgrel=1
pkgdesc="BAML - the language for agents (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
makedepends=('rust' 'cargo')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-language-0.11.0-alpha.4116.tar.gz")
sha256sums=('4e9132c38d4d0134eea74f61335ae8b406056d43ae729542cfabe3befdece8aa')

build() {
    cd "baml-baml-language-0.11.0-alpha.4116/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --bin baml-cli
}

package() {
    cd "baml-baml-language-0.11.0-alpha.4116/baml_language"
    install -Dm755 "target/release/baml-cli" "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
