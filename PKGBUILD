# Maintainer: Obscurely <adrian.obscurely@protonmail.com>

pkgname=falion
_pkgname=falion
pkgver=0.2.0.58.g19e0f8e
pkgrel=1
pkgdesc="A fast, asynchronous tool for getting and reading various programming resources."
url="https://github.com/Obscurely/falion"
license=("GPL-3.0-only")
depends=()
optdepends=()
makedepends=("rust" "cargo" "git")
arch=("x86_64")
provides=("falion")
conflicts=("falion-bin")
source=("$_pkgname::git+https://github.com/Obscurely/falion.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    export SHELL_COMPLETIONS_DIR="$PWD/completions"
    cargo build --release
}

check() {
    cd $_pkgname
    cargo test --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
