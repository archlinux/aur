pkgname=gemini-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal-based tool for interacting with Gemini"
arch=('x86_64')
license=('MIT')
depends=('git')
source=("git+https://github.com/marcosdanielr/gemini-cli.git")
sha256sums=('SKIP')

prepare() {
    if ! command -v rustc &> /dev/null; then
        echo "Rust is not installed. Please install Rust to continue."
        echo "You can install Rust using: sudo pacman -S rust"
        exit 1
    fi
}

build() {
    cd "$srcdir/gemini-cli"
    cargo build --release
}

package() {
    cd "$srcdir/gemini-cli"
    install -Dm755 target/release/gemini-cli "$pkgdir/usr/bin/gemini-cli"
}
