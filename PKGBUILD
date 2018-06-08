# Maintainer: jD91mZM2 <me@krake.one>
pkgname="powerline-rs"
pkgdesc="powerline-shell rewritten in Rust. Inspired by powerline-go."
pkgver=0.1.8
pkgrel=1
url="https://github.com/jD91mZM2/powerline-rs"
license=("MIT")
source=("https://github.com/jD91mZM2/powerline-rs/archive/$pkgver.tar.gz")
sha256sums=('d805366ed781df83e26d997a5ee7a14983319d8abf634227198740914de95cd8')
arch=("x86_64" "i386" "arm" "armv6h" "armv7h" "aarch64")
makedepends=("rust" "libgit2" "cmake") # cmake is used by libgit2-sys
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
    install -Dm 644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm 644 "$pkgname.fish" "$pkgdir/usr/share/fish/completions/$pkgname.fish"
}
