# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hygg
pkgver=0.1.20
pkgrel=1
pkgdesc='Minimalistic Vim-like TUI document reader.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/kruseio/hygg'
license=('AGPL-3.0')
makedepends=('cargo') # 'clang' 'gcc-libs')
options=(!lto !debug)
provides=(
    $pkgname
    'cli-epub-to-text'
    'cli-justify'
    'cli-pdf-to-text'
    'cli-text-reader'
    'cli-justify'
)
conflicts=($pkgname-git $pkgname-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da3c0d659d3e599fc640e42851da52abd194ee38a74c5d1dffb629a68ac19f91')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[0]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[1]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[2]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[3]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[4]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[5]}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
