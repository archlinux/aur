# Maintainer: sameoldlab <sameoldlab@proton.me>
pkgname=goldfish
_binname=gf
pkgver=0.1.0
pkgrel=1
pkgdesc='File search utility'
arch=('x86_64')
url='https://github.com/sameoldlab/goldfish'
license=('MPL-2.0')
depends=()
makedepends=('git' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sameoldlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1fe4d034f9ff09031e72d8df3de7408072cf408566f2b67781f6001d28b61174')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # optionally:
    # install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    # install -Dm644 completions/my-tool.bash "$pkgdir/usr/share/bash-completion/completions/my-tool"
}
