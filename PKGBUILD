# Maintainer: Alexcein Ramos <alexceinrp@gmail.com>
pkgname='githubfetch-fuan'
pkgver=0.1.0
pkgrel=2
pkgdesc="A Neofetch-like CLI tool that displays github information on kitty"
arch=('x86_64')
url="https://github.com/Fuan200/githubfetch"
license=('MIT')
depends=('kitty')
makedepends=('cargo')
options=('!lto')
source=("githubfetch-$pkgver.tar.gz::https://github.com/Fuan200/githubfetch/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d735fe0df5d10791fa7e9f5ce708661cdd4f63014462f2b913bd9368c5df3b3e')

prepare() {
    cd "githubfetch-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "githubfetch-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "githubfetch-$pkgver"
    install -Dm755 "target/release/githubfetch" "$pkgdir/usr/bin/githubfetch"
}
