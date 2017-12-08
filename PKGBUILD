# Maintainer: jD91mZM2 <me@krake.one>
pkgname="powerline-rs"
pkgdesc="powerline-shell rewritten in Rust. Inspired by powerline-go."
pkgver=0.1.4
pkgrel=1
url="https://github.com/jD91mZM2/powerline-rs"
license=("MIT" "custom:MIT")
source=("https://github.com/jD91mZM2/powerline-rs/archive/v$pkgver.tar.gz")
sha256sums=('0d0688c3ece672fa0cb9696c15c178934879dc634b4e5c793d09d0ca8f0df09c')
arch=("x86_64" "i386" "arm" "armv6h" "armv7h" "aarch64")
makedepends=("libgit2" "cargo" "cmake") # cmake is used by libgit2-sys
optdepends=(
    "bash-completion: Bash completion for powerline-rs"
    "fish: Fish completion for powerline-rs"
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 "$pkgname.bash-completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm 644 "$pkgname.fish" "$pkgdir/usr/share/fish/completions/$pkgname.fish"
}
